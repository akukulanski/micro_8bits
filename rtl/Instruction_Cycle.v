

`include "defines.v"


module Instruction_Cycle #(
    parameter INST_ADDR_WIDTH   = 8,
    parameter INST_DATA_WIDTH   = 8,
    parameter MEM_ADDR_WIDTH    = 8,
    parameter MEM_DATA_WIDTH    = 8
)(
    input                               clk,
    input                               arst,

    output  wire [INST_ADDR_WIDTH-1:0]  inst_addr,  // assigned from PC (registered)
    input   wire [INST_DATA_WIDTH-1:0]  inst_data,

    output  wire [INST_ADDR_WIDTH-1:0]  mem_addr,   // assigned from MAR (registered)
    input   wire [MEM_DATA_WIDTH-1:0]   mem_data_i,
    output  wire [MEM_DATA_WIDTH-1:0]   mem_data_o,
    output  reg                         mem_WE,     // write enable

    output  reg                         Exec,   // flag that tells the ALU to
                                                //  execute the operation
    input   wire [3:0]                  Flags,  // flags from the ALU
    input   wire [MEM_DATA_WIDTH-1:0]   AR,     // accumulator from the alu
    output  reg [INST_DATA_WIDTH-1:0]   IR,     // instruction register
    output  reg [INST_DATA_WIDTH-1:0]   IBR,    // inmediate buffer register
    output  reg [MEM_DATA_WIDTH-1:0]    MBR     // memory buffer register

);

    localparam STAGES = 6;

    reg                         valid       [0:STAGES-1];
    reg                         IR_vector   [0:STAGES-1];
    reg                         MBR_vector  [0:STAGES-1];

    reg [INST_ADDR_WIDTH-1:0]   PC              ;     // program counter
    reg [MEM_ADDR_WIDTH-1:0]    MAR;    // memory addr register
    reg [MEM_DATA_WIDTH-1:0]    MBR_o;  // memory buffer register (output)

    assign inst_addr    = PC;
    assign mem_addr     = MAR;
    assign mem_data_o   = MBR_o;

    reg [7:0] i;

    always @(posedge clk or arst) begin
        if(arst) begin
            PC      <= 0;
            MBR_o   <= 0;
            IR      <= 0;
            IBR     <= 0;
            MBR     <= 0;
            MAR     <= 0;
            mem_WE  <= 1'b0;
            Exec    <= 1'b0;

            for(i=0;i<STAGES;i=i+1) begin
                valid[i]        <= 0;
                /*IR_vector[i]    <= 0;
                MBR_vector[i]   <= 0;*/
            end

        end else begin

            for(i=1;i<STAGES;i=i+1) begin
                valid[i]        <= valid[i-1];
                IR_vector[i]    <= IR_vector[i-1];
                MBR_vector[i]   <= MBR_vector[i-1];
            end

            valid[0]        <= ~PC[0] ;     // even = instruction, odd = operand
            IR_vector[0]    <= inst_data;   // instruction fetch
            PC              <= PC + 1;      // next instruction or operand
            MBR_vector[0]   <= mem_data_i;  // buffer ram data


            if(valid[2]) begin
                case(IR_vector[2])

                    `LOAD_X:
                    begin
                        MAR <= IR[1];   // position of operand
                    end

                    `STORE_X: //need value of accumulator...
                    begin
                    end


                endcase

            end



            if(valid[STAGES]) begin
                // execute...
            end




                ST_FETCH:
                begin
                    IR      <= inst_data;   // buffer instruction
                    PC      <= PC + 1;      // increment position
                    state   <= ST_DECODE;   // next state = decode
                end

                ST_DECODE:
                begin
                    IBR     <= inst_data;   // buffer operand
                    PC      <= PC + 1;      // increment position
                    state   <= ST_EXECUTE;  // by default, next state = execute.

                    // Check if a memory operation is required, to set
                    //  the next state accordingly.
                    if(IR == `STORE_X || IR == `STORE_I) begin
                        // write memory operation
                        state   <= ST_WRITE_MEM;
                    end else if(
                        (IR == `LOAD_X) ||          // load_x
                        ( ^IR[7:6] && ~|IR[5:2] ) // Arithm/Logic
                        ) begin
                            // read memory operation
                            state   <= ST_READ_MEM;
                            // The instructions defined so far requiring memory
                            //  access are LOAD_X, and the arithmetic or logic
                            //  operations with the 2nd operand stored in memory.
                            //  The last ones match the following structure:
                            //  8'b010000XX  <-- add_x, sub_x, addc_x, subc_x
                            //  8'b100000XX  <-- nor_x, nand_x, xor_x, xnor_x
                            //  That condition is represented this way: (^IR[7:6]) && ~|IR[5:2]
                    end
                    // there is no 'else' clause because the default next state
                    // is already defined (ST_EXECUTE)
                end

                ST_WRITE_MEM:
                begin
                    mem_WE  <= 1'b1;        // of course, we are writing memory
                    state   <= ST_EXECUTE;  // the writing lasts one clock, so next
                                            //  state is always execute
                    case (IR)

                        `STORE_X:
                        begin
                            MAR     <= IBR; // memory address = inmediate buffer register
                            MBR_o   <= AR;  // memory data output = accumulator
                        end

                        `STORE_I:
                        begin
                            MAR     <= AR;  // memory address = accumulator
                            MBR_o   <= IBR; // memory data output = inmediate buffer register
                        end

                        default:
                        begin
                            mem_WE <= 1'b0; // just in case, if the operation is unknown,
                                            //  won't write anything. Could be ommited to
                                            //  simplify logic
                        end

                    endcase
                end

                ST_READ_MEM:
                begin
                    MAR     <= IBR;         // set the memory address
                    state   <= ST_EXECUTE;  // the reading lasts one clock, so next
                                            //  state is always execute

                    // The following 'if' statement is ommited because it is assumed that in
                    //  this state is reached ONLY if a memory access is required.
                    //  Being so, describe accordingly the FSM
                    /*
                    if(IR == `LOAD_X || IR[7:2] == 6'b010000 || IR[7:2] == 6'b100000) begin
                        // Instruction that requires a Memory Operand
                        MAR     <= IBR;     // set the memory address
                    end
                    */
                end

                ST_EXECUTE:
                begin
                    Exec    <= 1'b1;        // tells the ALU to perform the operation
                    state   <= ST_FETCH;    // next state = fetch

                    case (IR)

                        `LOAD_X:
                            MBR <= mem_data_i;

                        `JMP:
                            PC  <= PC + IBR;

                        `JZ:
                            if(Flags[`ZERO]) PC <= PC + IBR;

                        `JC:
                            if(Flags[`CARRY]) PC <= PC + IBR;

                        `JN:
                            if(Flags[`NEG]) PC <= PC + IBR;

                        `JV:
                            if(Flags[`OV]) PC <= PC + IBR;

                        default:
                            if ( ^IR[7:6] && ~|IR[5:2] ) MBR  <= mem_data_i;  // buffers the memory data

                    endcase
                end

                default: begin
                    state <= ST_ERROR;
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
    initial begin
        $dumpfile ("./waves/microprocessor.vcd");
        $dumpvars (0,Instruction_Cycle);
    end

endmodule
