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

`ifndef __DEFINES__
`define __DEFINES__

//`timescale 1ns/1ps

    // Widths
    `define ROM_ADDR_WIDTH  8
    `define ROM_DATA_WIDTH  8
    `define RAM_ADDR_WIDTH  8
    `define RAM_DATA_WIDTH  8


    // Memory instructions
    `define LOAD_X  8'b00000000
    `define STORE_X 8'b00000001
    `define LOAD_I  8'b00000010
    `define STORE_I 8'b00000011

    // Arithmetic instructions
    `define ADD_X   8'b01000000
    `define SUB_X   8'b01000001
    `define ADDC_X  8'b01000010
    `define SUBC_X  8'b01000011
    `define ADD_I   8'b01000100
    `define SUB_I   8'b01000101
    `define ADDC_I  8'b01000110
    `define SUBC_I  8'b01000111

    // Logical instructions
    `define NOR_X   8'b10000000
    `define NAND_X  8'b10000001
    `define XOR_X   8'b10000010
    `define XNOR_X  8'b10000011
    `define NOR_I   8'b10000100
    `define NAND_I  8'b10000101
    `define XOR_I   8'b10000110
    `define XNOR_I  8'b10000111

    // Jump instructions
    `define JMP     8'b11000000
    `define JZ      8'b11000001
    `define JC      8'b11000010
    `define JN      8'b11000011
    `define JV      8'b11000100
    /*
    `define JZ      8'b11000000
    `define JC      8'b11000001
    `define JN      8'b11000010
    `define JV      8'b11000011
    `define JMP     8'b11000100*/

    // ALU FLAGS BITFIELD
    `define CARRY   0
    `define ZERO    1
    `define NEG     2
    `define OV      3

    // 2nd OPERAND BITFIELD
    `define MOV_OPER2_BIT   1       // bit 1 of instruction
    `define ALU_OPER2_BIT   2       // bit 2 of instruction
    // 2nd OPERAND VALUE
    `define OPER2_X 1'b0    // 0=memory
    `define OPER2_I 1'b1    // 1=inmediate

`endif
