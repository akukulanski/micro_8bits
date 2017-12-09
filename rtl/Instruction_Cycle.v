// -----------------------------------------------------------------------------
//
// Copyright (c) 2017 by Ariel Kukulanski and Nahuel Carducci
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
// Authors:
// Ariel Kukulanski - akukulanski@gmail.com
// Nahuel Carducci - nahuel.cci@gmail.com
//
// Description:
//  This is the description of a very basic microprocessor,
//  and is a project for the course 'Design of Digital Integrated
//  Circuits', in the UTN (National University of Technology), Argentina.
//
//
// -----------------------------------------------------------------------------


`include "defines.v"
//`include "myFunction.v"

module Instruction_Cycle #(
    parameter INST_ADDR_WIDTH   = 8,
    parameter INST_DATA_WIDTH   = 8,
    parameter MEM_ADDR_WIDTH    = 8,
    parameter MEM_DATA_WIDTH    = 8
)(
    input                               clk,
    input                               arst,

    output  wire [INST_ADDR_WIDTH-1:0]  rom_addr,  // assigned from PC (registered)
    input   wire [INST_DATA_WIDTH-1:0]  rom_data ,

    output  wire [MEM_ADDR_WIDTH-1:0]   mem_addr,   // assigned from MAR (registered)
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
    localparam  ST_RESET        = 0,
                ST_FETCH        = 1,
                ST_DECODE       = 2,
                ST_WRITE_MEM    = 3,
                ST_READ_MEM     = 4,
                ST_EXECUTE      = 5;

    reg [2:0]                   state;  // current state of FSM
    reg [INST_ADDR_WIDTH-1:0]   PC;     // program counter
    reg [MEM_ADDR_WIDTH-1:0]    MAR;    // memory addr register
    reg [MEM_DATA_WIDTH-1:0]    MBR_o;  // memory buffer register (output)
    reg [INST_DATA_WIDTH-1:0]   rom_data_syn ;

    assign rom_addr     = PC;
    assign mem_addr     = MAR;
    assign mem_data_o   = MBR_o;


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
            rom_data_syn  <= 0;
        end else begin
            mem_WE  <= 1'b0;
            Exec    <= 1'b0;
            rom_data_syn    <= rom_data ;   // ROM registered!
            MBR             <= mem_data_i;  // RAM registered!

            case (state)

                ST_RESET:
                begin
                    // here, the rom address of the first instruction is set.
                    PC      <= 0;
                    state   <= ST_FETCH;
                end

                ST_FETCH:
                begin
                    // The ROM address was set in the previous clock, so
                    // the instruction is available in rom_data, but it's not
                    // registered yet.
                    // The PC is incremented to read the instruction operand
                    PC      <= PC + 1;
                    state   <= ST_DECODE;
                end

                ST_DECODE:
                begin
                    // Here the instruction is already available in rom_data_syn.
                    // The next state will depend on the instruction.
                    // In this cycle, the operand is in rom_data, not registered yet.
                    // The PC is incremented to allow a sooner fetch (unless there is a jump)
                    IR      <= rom_data_syn ;   // buffer instruction for future access
                    PC      <= PC + 1;          // increment program counter
                    state   <= ST_EXECUTE;      // by default, next state = execute.

                    // Check if a memory operation is required, to set
                    //  the next state accordingly.
                    if( memWriteRequired(rom_data_syn ) ) begin
                        state   <= ST_WRITE_MEM;
                    end else if( memReadRequired(rom_data_syn ) ) begin
                        state   <= ST_READ_MEM;
                    end
                    // there is no 'else' clause since the default next state
                    // is already defined (ST_EXECUTE)
                end

                ST_WRITE_MEM:
                begin
                    // Here both the instruction and the operand are available
                    // The instruction is in the instruction register IR
                    // The operand is in the buffer rom_data_syn
                    mem_WE  <= 1'b1;        // of course, we are writing memory
                    PC      <= PC + 1;      // doing fetch here
                    state   <= ST_DECODE ;  // so, next state is decode.

                    case (IR)

                        `STORE_X:
                        begin
                            MAR     <= rom_data_syn ;   // memory address = inmediate buffer register
                            MBR_o   <= AR;              // memory data output = accumulator
                        end

                        `STORE_I:
                        begin
                            MAR     <= AR;              // memory address = accumulator
                            MBR_o   <= rom_data_syn ;   // memory data output = inmediate buffer register
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
                    MAR     <= rom_data_syn ;   // set the memory address
                    state   <= ST_EXECUTE;      //
                end

                ST_EXECUTE:
                begin
                    // Here both the instruction and the operand are available
                    // The instruction is in the instruction register IR
                    // The operand is in the buffer rom_data_syn
                    Exec    <= 1'b1;        // tells the ALU to perform the operation
                    // Assuming no jmp:
                    state   <= ST_DECODE;   // unless there is a jmp, the fetch is done here
                    PC      <= PC + 1;
                    IBR     <= rom_data_syn ;   //

                    case (IR)

                        /*`LOAD_X:
                            MBR     <= mem_data_i;*/

                        `JMP:
                        begin
                            PC      <= PC + rom_data_syn ;
                            state   <= ST_FETCH;
                        end

                        `JZ:
                            if(Flags[`ZERO]) begin
                                PC <= PC + rom_data_syn ;
                                state   <= ST_FETCH;
                            end

                        `JC:
                            if(Flags[`CARRY]) begin
                                PC <= PC + rom_data_syn ;
                                state   <= ST_FETCH;
                            end

                        `JN:
                            if(Flags[`NEG]) begin
                                PC <= PC + rom_data_syn ;
                                state   <= ST_FETCH;
                            end

                        `JV:
                            if(Flags[`OV]) begin
                                PC <= PC + rom_data_syn ;
                                state   <= ST_FETCH;
                            end

                        /*default:
                            if ( ^IR[7:6] && ~|IR[5:2] ) MBR  <= mem_data_i;  // buffers the memory data*/

                    endcase
                end

                default: begin
                    state <= ST_RESET;
                end

            endcase

        end


    end

    function  memReadRequired;
        // The instructions defined so far requiring memory
        //  access are LOAD_X, and the arithmetic or logic
        //  operations with the 2nd operand stored in memory.
        //  The last ones match the following structure:
        //  8'b010000XX  <-- add_x, sub_x, addc_x, subc_x
        //  8'b100000XX  <-- nor_x, nand_x, xor_x, xnor_x
        //  That condition is represented this way: (^IR[7:6]) && ~|IR[5:2]
        input [7:0] inst;
        begin
            memReadRequired = ( inst == `LOAD_X ) ||
                ( ^inst[7:6] && ~|inst[5:2] ) ;
        end
    endfunction

    function memWriteRequired;
        input [7:0] inst;
        begin
            memWriteRequired =
                inst == `STORE_X ||
                inst == `STORE_I ;
        end
    endfunction


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
