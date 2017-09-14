

`include "defines.v"

module Fetch(
    input wire          clk,
    input wire          arst,
    input wire [7:0]    PC_i,
    input wire [7:0]    AR_i,
    input wire [7:0]    inst_data,

    output reg [7:0]    PC_o,   // program counter out (rom address)
    output reg [7:0]    AR_o,   // accumulator register out ()
    output reg [7:0]    IR_o,   // instruction register

    output reg          rdy_next,
    input wire          free_next,
    input wire          rdy,
    output wire         free

);

    // always takes one clock, so:
    assign free = free_next;

    always @ ( posedge clk or arst ) begin
        if(arst) begin
            PC_o        <= 0;
            AR_o        <= 0;
            IR_o        <= 0;
            rdy_next    <= 0;
        end else begin
            if(free_next) rdy_next <= 0;
            if(free_next && rdy) begin
                IR_o    <= inst_data;   // buffer operand
                PC_o    <= PC_i + 1;    // increment position
                AR_o    <= AR_i;
                rdy_next <= 1;
            end
        end
    end



endmodule
