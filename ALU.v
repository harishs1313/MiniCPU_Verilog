module ALU (
    input [3:0] A, B,
    input [1:0] ALU_Sel,
    output reg [3:0] ALU_Out
);

always @(*) begin
    case (ALU_Sel)
        2'b00: ALU_Out = A + B;     // ADD
        2'b01: ALU_Out = A - B;     // SUB
        2'b10: ALU_Out = A & B;     // AND
        2'b11: ALU_Out = A | B;     // OR
        default: ALU_Out = 4'b0000;
    endcase
end

endmodule
