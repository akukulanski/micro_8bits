

`include "defines.v"


module Instruction_Cycle #(
    parameter INST_ADDR_WIDTH   = 8,
    parameter INST_DATA_WIDTH   = 8,
    parameter MEM_ADDR_WIDTH    = 8,
    parameter MEM_DATA_WIDTH    = 8
)(
    input                               clk,
    input                               arst,

    output  wire [INST_ADDR_WIDTH-1:0]  inst_addr,
    input   wire [INST_DATA_WIDTH-1:0]  inst_data,

    input   wire [INST_ADDR_WIDTH-1:0]  mem_addr,
    input   wire [MEM_DATA_WIDTH-1:0]   mem_data_i,
    output  wire [MEM_DATA_WIDTH-1:0]   mem_data_o,
    output  reg                         mem_WE,

    output  reg                         Exec,
    input   wire [3:0]                  Flags,
    input   wire [MEM_DATA_WIDTH-1:0]   AR,
    output  reg [INST_DATA_WIDTH-1:0]   IR,     // instruction register
    output  reg [INST_DATA_WIDTH-1:0]   IBR,    // Inmediate buffer register
    output  reg [MEM_DATA_WIDTH-1:0]    MBR     // memory buffer register

);

    localparam  ST_FETCH        = 0,
                ST_DECODE       = 1,
                ST_READ_MEM     = 2,
                ST_WRITE_MEM    = 3,
                ST_EXECUTE      = 4;

    reg [2:0]                   state;
    reg [INST_ADDR_WIDTH-1:0]   PC;     // program counter
    //reg [INST_ADDR_WIDTH-1:0]   IAR;    // instruction addr register
    //reg [INST_DATA_WIDTH-1:0]   IR;     // instruction register
    reg [MEM_ADDR_WIDTH-1:0]    MAR;    // memory addr register
    reg [MEM_DATA_WIDTH-1:0]    MBR_o;    // memory buffer register

    assign inst_addr    = PC;
    assign mem_addr     = MAR;
    assign mem_data_o   = MBR_o;



    always @(posedge clk or arst) begin
        if(arst) begin
            PC      <= 0;
            MBR_o   <= 0;
            mem_WE  <= 1'b0;
            Exec    <= 1'b0;
        end else begin
            mem_WE  <= 1'b0;
            Exec    <= 1'b0;
            // if(mem_WE == 1'b0) MBR <= mem_data_i; ---
            case (state)

                ST_FETCH:
                begin
                    //inst_addr <= PC;
                    IR      <= inst_data;
                    PC      <= PC + 1;
                    state   <= ST_DECODE;
                end

                ST_DECODE:
                begin
                    IBR     <= inst_data;
                    PC      <= PC + 1;

                    if(IR[7:6] == 2'b00) begin
                        // MOV operation
                        if(IR == `STORE_X || IR == `STORE_I) begin
                            state   <= ST_READ_MEM;
                        end else if(IR == `LOAD_X) begin
                            state   <= ST_WRITE_MEM;
                        /*end else if(IR == `LOAD_I) begin
                        */
                        end else begin
                            state   <= ST_EXECUTE;
                        end
                    end


                end

                ST_WRITE_MEM:
                begin
                    mem_WE  <= 1'b1;
                    state   <= ST_EXECUTE;
                    case (IR)

                        `STORE_X:
                        begin
                            MAR     <= IBR; // assign mem_addr = MAR ??
                            MBR_o   <= AR;
                        end

                        `STORE_I:
                        begin
                            MAR     <= AR;
                            MBR_o   <= IBR;
                        end

                        default:
                        begin
                        end

                    endcase
                end

                ST_READ_MEM:
                begin
                    state   <= ST_EXECUTE;
                    if(IR == `LOAD_X || IR[7:2] == 6'b010000 || IR[7:2] == 6'b100000) begin
                        // Instruction that requires a with Memory Operand
                        MAR     <= IBR;
                    end

                end

                ST_EXECUTE:
                begin
                    Exec    <= 1'b1;
                    mem_WE  <= 1'b0;
                    state   <= ST_FETCH;

                    case (IR)

                        `LOAD_X:
                        begin
                            MBR     <= mem_data_i;
                        end

                        `JMP:
                        begin
                            PC      <= PC + IBR;
                        end

                        `JZ:
                        begin
                            if(Flags[`ZERO]) PC <= PC + IBR;
                        end

                        `JC:
                        begin
                            if(Flags[`CARRY]) PC <= PC + IBR;
                        end

                        `JN:
                        begin
                            if(Flags[`NEG]) PC <= PC + IBR;
                        end

                        `JV:
                        begin
                            if(Flags[`OV]) PC <= PC + IBR;
                        end

                        default:
                        begin
                        end


                    endcase

                end

                default: begin

                end

            endcase

        end

    end


    `ifdef COCOTB_SIM
    initial begin
        $dumpfile ("waveform.vcd");
        $dumpvars (0,Instruction_Cycle);
      #1;
    end
    `endif

endmodule
