

`include "defines.v"


module ALU #(
    parameter   WIDTH       = 8
)(
    input                       clk,
    input                       arst,
    input   wire                Exec,
    input   wire [WIDTH-1:0]    IR,
    input   wire [WIDTH-1:0]    IBR,
    input   wire [WIDTH-1:0]    MBR,
    output  reg [WIDTH-1:0]     AR,      // accumulator register
    output  reg [3:0]           Flags

);

    wire [WIDTH-1:0]    oper2;
    wire [WIDTH:0]      result,
                        _add,
                        _addc,
                        _sub,
                        _subc,
                        _nor,
                        _nand,
                        _xor,
                        _xnor,
                        _load;
    wire                carry,
                        ov,
                        zero,
                        neg,
                        ov_,
                        zero_,
                        neg_,
                        oper2_bit;

    assign oper2_bit = (IR == `LOAD_X || IR == `LOAD_I) ?   IR[`MOV_OPER2_BIT] :
                                                            IR[`ALU_OPER2_BIT] ;
    assign oper2 = ( oper2_bit == `OPER2_X ) ? MBR : IBR ;

    assign _add     = AR + oper2;
    assign _addc    = AR + oper2 + Flags[`CARRY];
    assign _sub     = AR - oper2;
    assign _subc    = AR - oper2 - Flags[`CARRY];
    assign _nor     = { Flags[`CARRY] , ~(AR | oper2) };
    assign _nand    = { Flags[`CARRY] , ~(AR & oper2) };
    assign _xor     = { Flags[`CARRY] , AR ^ oper2 };
    assign _xnor    = { Flags[`CARRY] , ~(AR ^ oper2) };
    assign _load    = { Flags[`CARRY] , oper2 };    // should reset carry, ov?
    //assign _store   = { 1'b0 , oper2 };
    assign _unchanged = {Flags[`CARRY] , AR };

    assign result = (IR == `ADD_X)    ? _add :
                    (IR == `SUB_X)    ? _sub :
                    (IR == `ADDC_X)   ? _addc :
                    (IR == `SUBC_X)   ? _subc :
                    (IR == `ADD_I)    ? _add :
                    (IR == `SUB_I)    ? _sub :
                    (IR == `ADDC_I)   ? _addc :
                    (IR == `SUBC_I)   ? _subc :
                    (IR == `NOR_X)    ? _nor :
                    (IR == `NAND_X)   ? _nand :
                    (IR == `XOR_X)    ? _xor :
                    (IR == `XNOR_X)   ? _xnor :
                    (IR == `NOR_I)    ? _nor :
                    (IR == `NAND_I)   ? _nand :
                    (IR == `XOR_I)    ? _xor :
                    (IR == `XNOR_I)   ? _xnor :
                    (IR == `LOAD_X)   ? _load :
                    (IR == `LOAD_I)   ? _load :
                  //(IR == `STORE_X)  ? _store :
                  //(IR == `STORE_I)  ? _store :
                                          {Flags[`CARRY] , AR }; //

    assign carry = result[WIDTH];

    assign ov_    = (AR[WIDTH-1] ^ oper2[WIDTH-1] ) ? 1'b0 :
                    (result[WIDTH] == AR[WIDTH-1])  ? 1'b0 :
                                                                1'b1 ;

    assign ov =     (IR == `ADD_X)    ? ov_ :
                    (IR == `SUB_X)    ? ov_ :
                    (IR == `ADDC_X)   ? ov_ :
                    (IR == `SUBC_X)   ? ov_ :
                    (IR == `ADD_I)    ? ov_ :
                    (IR == `SUB_I)    ? ov_ :
                    (IR == `ADDC_I)   ? ov_ :
                    (IR == `SUBC_I)   ? ov_ :
                                        Flags[`OV] ;

    assign zero_  = ( result[WIDTH-1:0] == {WIDTH{1'b0}} ) ? 1'b1 : 1'b0 ;

    assign zero =   (IR == `ADD_X)    ? zero_ :
                    (IR == `SUB_X)    ? zero_ :
                    (IR == `ADDC_X)   ? zero_ :
                    (IR == `SUBC_X)   ? zero_ :
                    (IR == `ADD_I)    ? zero_ :
                    (IR == `SUB_I)    ? zero_ :
                    (IR == `ADDC_I)   ? zero_ :
                    (IR == `SUBC_I)   ? zero_ :
                    (IR == `NOR_X)    ? zero_ :
                    (IR == `NAND_X)   ? zero_ :
                    (IR == `XOR_X)    ? zero_ :
                    (IR == `XNOR_X)   ? zero_ :
                    (IR == `NOR_I)    ? zero_ :
                    (IR == `NAND_I)   ? zero_ :
                    (IR == `XOR_I)    ? zero_ :
                    (IR == `XNOR_I)   ? zero_ :
                    /*
                    (IR == `LOAD_X)   ? zero_ : // Should set this flag?
                    (IR == `LOAD_I)   ? zero_ : // Should set this flag?
                    */
                  //(IR == `STORE_X)  ? Flags[`ZERO] :
                  //(IR == `STORE_I)  ? Flags[`ZERO] :
                                        Flags[`ZERO] ;
        // 255+1 = 0

    assign neg_   = result[WIDTH-1];

    assign neg =    (IR == `ADD_X)    ? neg_ :
                    (IR == `SUB_X)    ? neg_ :
                    (IR == `ADDC_X)   ? neg_ :
                    (IR == `SUBC_X)   ? neg_ :
                    (IR == `ADD_I)    ? neg_ :
                    (IR == `SUB_I)    ? neg_ :
                    (IR == `ADDC_I)   ? neg_ :
                    (IR == `SUBC_I)   ? neg_ :
                    (IR == `NOR_X)    ? neg_ : // Should set this flag?
                    (IR == `NAND_X)   ? neg_ : // Should set this flag?
                    (IR == `XOR_X)    ? neg_ : // Should set this flag?
                    (IR == `XNOR_X)   ? neg_ : // Should set this flag?
                    (IR == `NOR_I)    ? neg_ : // Should set this flag?
                    (IR == `NAND_I)   ? neg_ : // Should set this flag?
                    (IR == `XOR_I)    ? neg_ : // Should set this flag?
                    (IR == `XNOR_I)   ? neg_ : // Should set this flag?
                    /*
                    (IR == `LOAD_X)   ? neg_ : // Should set this flag?
                    (IR == `LOAD_I)   ? neg_ : // Should set this flag?
                    */
                  //(IR == `STORE_X)  ? Flags[`ZERO] :
                  //(IR == `STORE_I)  ? Flags[`ZERO] :
                                        Flags[`ZERO] ;

    always @(posedge clk or arst) begin
        if (arst) begin
            AR      <= 0;
            Flags   <= 0;
        end else begin
            if (Exec) begin
                AR              <= result;
                Flags[`CARRY]   <= carry;
                Flags[`OV]      <= ov;
                Flags[`ZERO]    <= zero;
                Flags[`NEG]     <= neg;
            end
        end
    end

    `ifdef COCOTB_SIM
    initial begin
      $dumpfile ("waveform.vcd");
      $dumpvars (0,ALU);
      #1;
    end
    `endif
    initial begin
        $dumpfile ("./waves/microprocessor.vcd");
        $dumpvars (0,ALU);
    end

endmodule
/*
consultas:
- Flags se setean/resetean en c/ instrucción aunq no tenga q ver?
(ej: instrucción lógica modifica carry?)
*/
