

`include "defines.v"

module mem_address(
    input wire          clk,
    input wire          arst,
    input wire [7:0]    PC,
    input wire [7:0]    AR,
    input wire [7:0]    IR,
    input wire [7:0]    IBR,

    output reg [7:0]    PC_,   // program counter out (rom address)
    output reg [7:0]    AR_,   // accumulator register out ()
    output reg [7:0]    IR_,   // instruction register
    output reg [7:0]    IBR_,  // operand buffer register

    input wire          mem_read,
    input wire          mem_write,

    output reg [7:0]    mem_addr,
    output reg [7:0]    mem_data_o,
    input wire [7:0]    mem_data_i,
    output reg          mem_we,

    output reg          rdy_next,
    input wire          free_next,
    input wire          rdy,
    output wire         free


);

    localparam  ST_IDLE = 0,
                ST_RD   = 1,
                ST_WR   = 2,
                ST_DONE = 3;
    reg [1:0] state;

    assign free = (state == ST_IDLE) ? 1'b1 : 1'b0 ; // revisar


    always @ ( posedge clk or arst ) begin
        if(arst) begin
            PC_         <= 0;
            AR_         <= 0;
            IR_         <= 0;
            IBR_        <= 0;
            mem_addr    <= 0;
            mem_data_o  <= 0;
            mem_we      <= 0;
            rdy_next    <= 0;
        end else begin
            if(free_next) begin

                case (state)

                    ST_IDLE:
                    begin

                    end

                endcase

            end

            IBR_        <= IBR;   // buffer operand
            PC_         <= PC;    // increment position
            AR_         <= AR;
            IR_         <= IR;

            if()

            if(mem_read) begin
                MAR <= IBR;
            end else if (mem_write) begin

                case (IR)

                    `STORE_X:
                    begin
                        MAR         <= IBR; // memory address = inmediate buffer register
                    end

                    `STORE_I:
                    begin
                        MAR         <= AR;  // memory address = accumulator
                    end

                    default:
                    begin
                    end

                endcase
            end


        end
    end



endmodule
