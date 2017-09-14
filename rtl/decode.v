
`include "defines.v"

module Decode(
    input wire          clk,
    input wire          arst,
    input wire [7:0]    PC_i,
    input wire [7:0]    AR_i,
    input wire [7:0]    IR_i,
    input wire [7:0]    inst_data,

    output reg [7:0]    PC_o,   // program counter out (rom address)
    output reg [7:0]    AR_o,   // accumulator register out ()
    output reg [7:0]    IR_o,   // instruction register out
    output reg [7:0]    IBR_o,  // operand buffer register

    output reg          mem_read,
    output reg          mem_write,

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
                IBR_o       <= inst_data;   // buffer operand
                PC_o        <= PC_i + 1;    // increment position
                AR_o        <= AR_i;
                IR_o        <= IR_i;
                mem_read    <= 0;
                mem_write   <= 0;

                if(IR_i == `STORE_X || IR_i == `STORE_I) begin
                    // write memory operation
                    mem_write <= 1;
                end else if(
                    (IR_i == `LOAD_X) ||          // load_x
                    ( ^IR_i[7:6] && ~|IR_i[5:2] ) // Arithm/Logic
                    ) begin
                        // read memory operation
                        mem_read <= 1;
                end else begin

                end
            end

        end
    end



endmodule
