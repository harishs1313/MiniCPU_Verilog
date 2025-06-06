module ControlUnit (
    input [2:0] opcode,       // 3-bit instruction code
    output reg [1:0] ALU_Sel, // Select ALU operation (same as before)
    output reg reg_write      // Register write enable signal (for future use)
);

always @(*) begin
    case (opcode)
        3'b000: begin // ADD
            ALU_Sel = 2'b00; // ADD operation
            reg_write = 1;
        end
        3'b001: begin // SUB
            ALU_Sel = 2'b01; // SUB operation
            reg_write = 1;
        end
        3'b010: begin // AND
            ALU_Sel = 2'b10; // AND operation
            reg_write = 1;
        end
        3'b011: begin // OR
            ALU_Sel = 2'b11; // OR operation
            reg_write = 1;
        end
        3'b100: begin // NOP (No operation)
            ALU_Sel = 2'b00;
            reg_write = 0;
        end
        default: begin
            ALU_Sel = 2'b00;
            reg_write = 0;
        end
    endcase
end

endmodule