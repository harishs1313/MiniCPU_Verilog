`timescale 1ns/1ps

module MiniCPU_tb;

reg clk;
reg [2:0] opcode;
reg [1:0] wr_addr, rd_addr1, rd_addr2;
reg [3:0] wr_data;
wire [3:0] alu_result;
wire reg_write;

// Instantiate MiniCPU
MiniCPU cpu (
    .clk(clk),
    .opcode(opcode),
    .wr_addr(wr_addr),
    .rd_addr1(rd_addr1),
    .rd_addr2(rd_addr2),
    .wr_data(wr_data),
    .alu_result(alu_result),
    .reg_write(reg_write)
);

// Clock generation: 10ns period
initial clk = 0;
always #5 clk = ~clk;

initial begin
    $dumpfile("MiniCPU.vcd");
    $dumpvars(0, MiniCPU_tb);

    // Initialize signals
    opcode = 3'b000;  // ADD
    wr_addr = 2'b00;
    rd_addr1 = 2'b00;
    rd_addr2 = 2'b01;
    wr_data = 4'b1010;  // Write value 10 to reg 0
    
    // Wait for write to happen
    #10;
    
    // Write another value to reg 1
    wr_addr = 2'b01;
    wr_data = 4'b0101;  // Write value 5 to reg 1
    #10;
    
    // Perform ADD operation: reg0 + reg1
    opcode = 3'b000; // ADD
    rd_addr1 = 2'b00;
    rd_addr2 = 2'b01;
    wr_addr = 2'b10; // Write result to reg 2
    wr_data = 4'b0000; // Don't care, ALU result will write
    #10;
    
    // Perform SUB operation: reg0 - reg1
    opcode = 3'b001; // SUB
    rd_addr1 = 2'b00;
    rd_addr2 = 2'b01;
    wr_addr = 2'b11; // Write result to reg 3
    #10;

    // Finish simulation
    $finish;
end

endmodule
