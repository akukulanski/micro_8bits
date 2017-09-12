


`include "defines.v"

module micro(
    input   wire                        clk,
    input   wire                        arst,

    output  wire [`ROM_ADDR_WIDTH-1:0]  rom_addr,
    input   wire [`ROM_DATA_WIDTH-1:0]  rom_data,

    output  wire [`RAM_ADDR_WIDTH-1:0]  ram_addr,
    output  wire ram_wr_en,
    input   wire [`RAM_DATA_WIDTH-1:0]  ram_data_rd,
    output  wire [`RAM_DATA_WIDTH-1:0]  ram_data_wr

);

    reg     rst_i;
    reg     rst_ii;

    wire                        rst_sync;
    wire [`RAM_DATA_WIDTH-1:0]  AR;
    wire [3:0]                  Flags;
    wire                        Exec;
    wire [`ROM_DATA_WIDTH-1:0]  IR;     // instruction register
    wire [`RAM_DATA_WIDTH-1:0]  IBR;    // Inmediate buffer register
    wire [`RAM_DATA_WIDTH-1:0]  MBR;    // memory buffer register

    // Reset Sync
    assign rst_sync = rst_ii | arst;

    always @(posedge clk) begin
        rst_i   <= arst;
        rst_ii  <= rst_i;
    end

    Instruction_Cycle #(
        .INST_ADDR_WIDTH    (`ROM_ADDR_WIDTH),
        .INST_DATA_WIDTH    (`ROM_DATA_WIDTH),
        .MEM_ADDR_WIDTH     (`RAM_ADDR_WIDTH),
        .MEM_DATA_WIDTH     (`RAM_DATA_WIDTH)
    ) Instruction_Cycle_u (
        .clk            (clk),
        .arst           (rst_sync),

        .inst_addr      (rom_addr),
        .inst_data      (rom_data),

        .mem_addr       (ram_addr),
        .mem_data_i     (ram_data_rd),
        .mem_data_o     (ram_data_wr),
        .mem_WE         (ram_wr_en),

        .Exec           (Exec),
        .Flags          (Flags),
        .AR             (AR),
        .IR             (IR),
        .IBR            (IBR),
        .MBR            (MBR)
    );

    ALU #(
        .DATA_WIDTH     (`RAM_DATA_WIDTH),
        .ALU_INST_WIDTH (`ROM_DATA_WIDTH)
    ) ALU_u (
        .clk            (clk),
        .arst           (rst_sync),
        .Exec           (Exec),
        .IR             (IR),
        .IBR            (IBR),
        .MBR            (MBR),
        .AR             (AR),
        .Flags          (Flags)
    );

    
    `ifdef COCOTB_SIM
    initial begin
        $dumpfile ("waveform.vcd");
        $dumpvars (0,top_level);
      #1;
    end
    `endif


endmodule
