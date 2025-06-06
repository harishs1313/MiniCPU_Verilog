module MiniCPU (
    input clk,
    input [2:0] opcode,
    input [1:0] wr_addr,
    input [1:0] rd_addr1,
    input [1:0] rd_addr2,
    input [3:0] wr_data,
    output [3:0] alu_result,
    output reg_write
);

wire [1:0] alu_sel;
wire [3:0] rd_data1, rd_data2;

// Instantiate Control Unit
ControlUnit cu (
    .opcode(opcode),
    .ALU_Sel(alu_sel),
    .reg_write(reg_write)
);

// Instantiate Register File
RegisterFile rf (
    .clk(clk),
    .we(reg_write),           // write enable controlled by CU
    .wr_addr(wr_addr),
    .wr_data(wr_data),
    .rd_addr1(rd_addr1),
    .rd_addr2(rd_addr2),
    .rd_data1(rd_data1),
    .rd_data2(rd_data2)
);

// Instantiate ALU
ALU alu (
    .A(rd_data1),
    .B(rd_data2),
    .ALU_Sel(alu_sel),  // Use 2 bits for ALU_Sel from opcode or control unit
    .ALU_Out(alu_result)
);

endmodule
