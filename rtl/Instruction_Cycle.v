// -----------------------------------------------------------------------------
//
// Copyright (c) 2017 by Ariel Kukulanski
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; version 2.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// -----------------------------------------------------------------------------
//
// Author:
//  Ariel Kukulanski - akukulanski@gmail.com
//
// Description:
//  This is the description of a very basic microprocessor,
//  and is a project for the course 'Design of Digital Integrated
//  Circuits', in the UTN (National University of).
//  It's implemented with instruction pipelining.
//
//
// -----------------------------------------------------------------------------

`include "defines.v"

module Instruction_Cycle #(
    parameter INST_ADDR_WIDTH   = 8,
    parameter INST_DATA_WIDTH   = 8,
    parameter MEM_ADDR_WIDTH    = 8,
    parameter MEM_DATA_WIDTH    = 8
)(
    input                               clk,
    input                               arst,

    // ROM interface
    output  wire [INST_ADDR_WIDTH-1:0]  inst_addr,  // assigned from PC (registered)
    input   wire [INST_DATA_WIDTH-1:0]  inst_data,

    // RAM interface
    output  wire [INST_ADDR_WIDTH-1:0]  mem_addr,   // assigned from MAR (registered)
    input   wire [MEM_DATA_WIDTH-1:0]   mem_data_i,
    output  reg [MEM_DATA_WIDTH-1:0]    mem_data_o,
    output  reg                         mem_WE,     // write enable

    // From ALU
    input   wire [3:0]                  Flags,  // flags from the ALU
    input   wire [MEM_DATA_WIDTH-1:0]   AR,     // accumulator from the alu

    // To ALU
    output  wire [INST_DATA_WIDTH-1:0]  IR,     // instruction register
    output  wire [INST_DATA_WIDTH-1:0]  IBR,    // inmediate buffer register
    output  reg [MEM_DATA_WIDTH-1:0]    MBR,    // memory buffer register
    output  wire                        Exec    // flag that tells the ALU to
                                                //  execute the operation

);

    localparam STAGES = 5;
    localparam PC_DELAY = 4;    // to perform a relative jmp from the current Program Counter,
                                //  pipeline delay should be considered. (the instruction in
                                //  position X, will be executed when PC=X+2)

    reg                         valid       [0:STAGES-1];
    reg [INST_ADDR_WIDTH-1:0]   IR_vector   [0:STAGES-1];
    //reg [MEM_DATA_WIDTH-1:0]    MBR_vector  [0:STAGES-1];

    reg [INST_ADDR_WIDTH-1:0]   PC;     // program counter
    reg [MEM_ADDR_WIDTH-1:0]    MAR;    // memory addr register

    assign inst_addr    = PC;
    assign mem_addr     = MAR;

    assign Exec         = valid[3]; // revisar!!!!!!!!!!!!!!!!!!
    assign IR           = IR_vector[3];
    assign IBR          = IR_vector[2];

    reg [7:0] i;

    always @(posedge clk or arst) begin
        if(arst) begin
            PC          <= 0;
            mem_data_o  <= 0;
            MBR         <= 0;
            MAR         <= 0;
            mem_WE      <= 1'b0;

            for(i=0;i<STAGES;i=i+1) begin
                valid[i]        <= 0;
                IR_vector[i]    <= 0;
                //MBR_vector[i]   <= 0;
            end

        end else begin

            for(i=1;i<STAGES;i=i+1) begin
                valid[i]        <= valid[i-1];
                IR_vector[i]    <= IR_vector[i-1];
                //MBR_vector[i]   <= MBR_vector[i-1];
            end

            // Stage 0 & Stage 1 - Fetch Instruction and Operand (2 bytes)
            valid[0]        <= ~PC[0] ;     // even = instruction, odd = operand
            IR_vector[0]    <= inst_data;   // instruction fetch
            PC              <= PC + 1;      // next instruction or operand
            //MBR_vector[0]   <= mem_data_i;  // buffer ram data
            mem_WE          <= 1'b0;

            // Stage 2 - Set RAM Address to Read
            if(valid[1]) begin
                if( ( IR_vector[1] == `LOAD_X ) || ( ^IR_vector[1][7:6] && ~|IR_vector[1][5:2] ) ) begin // Arithm/Logic
                    MAR <= IR_vector[0];   // position of operand
                end
            end

            // Stage 3 - Read RAM
            if(valid[2]) begin
                if( ( IR_vector[2] == `LOAD_X ) || ( ^IR_vector[2][7:6] && ~|IR_vector[2][5:2] ) ) begin // Arithm/Logic
                    MBR <= mem_data_i;    //
                end
            end

            // Stage 4 - Execute Instruction
            if(valid[3]) begin

                case (IR_vector[3])

                    `JMP:
                    begin
                        PC  <= PC + IBR + 2 - PC_DELAY;
                        for(i=0;i<3;i=i+1) begin
                            valid[i]    <= 0;
                        end
                    end

                    `JZ:
                    begin
                        if(Flags[`ZERO]) begin
                            PC <= PC + IBR + 2 - PC_DELAY;
                            for(i=0;i<3;i=i+1) begin
                                valid[i]    <= 0;
                            end
                        end
                    end

                    `JC:
                    begin
                        if(Flags[`CARRY]) begin
                            PC <= PC + IBR + 2 - PC_DELAY;
                            for(i=0;i<3;i=i+1) begin
                                valid[i]    <= 0;
                            end
                        end
                    end

                    `JN:
                    begin
                        if(Flags[`NEG]) begin
                            PC <= PC + IBR + 2 - PC_DELAY;
                            for(i=0;i<3;i=i+1) begin
                                valid[i]    <= 0;
                            end
                        end
                    end

                    `JV:
                    begin
                        if(Flags[`OV]) begin
                            PC <= PC + IBR + 2 - PC_DELAY;
                            for(i=0;i<3;i=i+1) begin
                                valid[i]    <= 0;
                            end
                        end
                    end

                    default:
                    begin

                    end

                endcase

            end

            // Stage 5 - RAM Write
            if(valid[4]) begin
                case(IR_vector[4])

                    `STORE_X:
                    begin
                       MAR          <= IR_vector[3]; // memory address = inmediate buffer register
                       mem_data_o   <= AR;           // memory data output = accumulator
                       mem_WE       <= 1'b1;
                    end

                    `STORE_I:
                    begin
                       MAR          <= AR;           // memory address = accumulator
                       mem_data_o   <= IR_vector[3]; // memory data output = inmediate buffer register
                       mem_WE       <= 1'b1;
                    end

                    default:
                    begin
                    end

                endcase
            end

        end

    end


    `ifdef COCOTB_SIM
    initial begin
        $dumpfile ("waveform.vcd");
        $dumpvars (0,Instruction_Cycle);
        #1;
    end
    `endif

    integer lp;
    initial begin
        $dumpfile ("./waves/microprocessor.vcd");
        $dumpvars (0,Instruction_Cycle);
        for (lp=0; lp < STAGES; lp = lp+1) $dumpvars(0, valid[lp]);
        for (lp=0; lp < STAGES; lp = lp+1) $dumpvars(0, IR_vector[lp]);
        //for (lp=0; lp < STAGES; lp = lp+1) $dumpvars(0, valid[lp]);
    end

endmodule
