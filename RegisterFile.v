module RegisterFile(
    input clk,
    input we,
    input [1:0] wr_addr,
    input [3:0] wr_data,
    input [1:0] rd_addr1,
    input [1:0] rd_addr2,
    output reg [3:0] rd_data1,
    output reg [3:0] rd_data2
);

reg [3:0] reg_array [3:0];

// Initialize all registers to zero at simulation start
integer i;
initial begin
    for (i = 0; i < 4; i = i + 1)
        reg_array[i] = 4'b0000;
end

always @(posedge clk) begin
    if (we)
        reg_array[wr_addr] <= wr_data;
end

always @(*) begin
    rd_data1 = reg_array[rd_addr1];
    rd_data2 = reg_array[rd_addr2];
end


endmodule
