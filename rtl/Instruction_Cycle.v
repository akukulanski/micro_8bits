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
//  It's implemented with a FSM, with the following states:
//  Fetch, Decode, Read Memory, Write Memory, Execute, <Error>
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

    // states of the FSM
    localparam  ST_FETCH        = 0,
                ST_DECODE       = 1,
                ST_READ_MEM     = 2,
                ST_WRITE_MEM    = 3,
                ST_EXECUTE      = 4,
                ST_ERROR        = 5,
                ST_READ_INST    = 6,
                ST_RESET        = 7;

    reg [2:0]                   state;  // current state of FSM
    reg [INST_ADDR_WIDTH-1:0]   PC;     // program counter
    reg [MEM_ADDR_WIDTH-1:0]    MAR;    // memory addr register
    reg [MEM_DATA_WIDTH-1:0]    MBR_o;  // memory buffer register (output)

    assign inst_addr    = PC;
    assign mem_addr     = MAR;
    assign mem_data_o   = MBR_o;

    reg [INST_DATA_WIDTH-1:0] inst_data_syn;


    always @(posedge clk or posedge arst) begin
        if(arst) begin
            PC      <= 0;
            MBR_o   <= 0;
            IR      <= 0;
            IBR     <= 0;
            MBR     <= 0;
            MAR     <= 0;
            mem_WE  <= 1'b0;
            Exec    <= 1'b0;
            state   <= ST_RESET;
            inst_data_syn <= 0;
        end else begin
            mem_WE  <= 1'b0;
            Exec    <= 1'b0;
            // if(mem_WE == 1'b0) MBR <= mem_data_i; ---
            inst_data_syn   <= inst_data;   // ROM registered!
            MBR             <= mem_data_i;  // RAM registered!

            case (state)

                ST_RESET:
                begin
                    PC      <= 0;
                    state   <= ST_FETCH;
                end

                ST_FETCH:
                begin
                    PC      <= PC + 1;
                    state   <= ST_DECODE;
                end

                ST_DECODE:
                begin
                    IR      <= inst_data_syn;   // buffer instruction
                    PC      <= PC + 1;      // increment position
                    state   <= ST_EXECUTE;  // by default, next state = execute.

                    // Check if a memory operation is required, to set
                    //  the next state accordingly.
                    if(inst_data_syn == `STORE_X || inst_data_syn == `STORE_I) begin
                        // write memory operation
                        state   <= ST_WRITE_MEM;
                    end else if(
                        (inst_data_syn == `LOAD_X) ||          // load_x
                        ( ^inst_data_syn[7:6] && ~|inst_data_syn[5:2] ) // Arithm/Logic
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
                            MAR     <= inst_data_syn;   // memory address = inmediate buffer register
                            MBR_o   <= AR;              // memory data output = accumulator
                        end

                        `STORE_I:
                        begin
                            MAR     <= AR;              // memory address = accumulator
                            MBR_o   <= inst_data_syn;   // memory data output = inmediate buffer register
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
                    MAR     <= inst_data_syn;   // set the memory address
                    state   <= ST_EXECUTE;      // the reading lasts one clock, so next
                                                //  state is always execute

                end

                ST_EXECUTE:
                begin
                    Exec    <= 1'b1;        // tells the ALU to perform the operation
                    // Assuming no jmp:
                    state   <= ST_DECODE;   // unless there is a jmp, the fetch is done here
                    PC      <= PC + 1;
                    IBR     <= inst_data_syn;

                    case (IR)

                        /*`LOAD_X:
                            MBR     <= mem_data_i;*/

                        `JMP:
                        begin
                            PC      <= PC + inst_data_syn;
                            state   <= ST_FETCH;
                        end

                        `JZ:
                            if(Flags[`ZERO]) begin
                                PC <= PC + inst_data_syn;
                                state   <= ST_FETCH;
                            end

                        `JC:
                            if(Flags[`CARRY]) begin
                                PC <= PC + inst_data_syn;
                                state   <= ST_FETCH;
                            end

                        `JN:
                            if(Flags[`NEG]) begin
                                PC <= PC + inst_data_syn;
                                state   <= ST_FETCH;
                            end

                        `JV:
                            if(Flags[`OV]) begin
                                PC <= PC + inst_data_syn;
                                state   <= ST_FETCH;
                            end

                        /*default:
                            if ( ^IR[7:6] && ~|IR[5:2] ) MBR  <= mem_data_i;  // buffers the memory data*/

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

    `ifdef WAVEFORM
    initial begin
        $dumpfile ("./waves/microprocessor.vcd");
        $dumpvars (0,Instruction_Cycle);
    end
    `endif

endmodule
