module CLU (
    input  [3:0] A, B,
    input  [2:0] control,
    output reg [3:0] result,
    output zero_flag,
    output sign_flag
);

    always @(*) begin
        case (control)
            3'b000: result = A & B;
            3'b001: result = A | B;
            3'b010: result = A ^ B;
            3'b011: result = ~(A | B);
            3'b100: result = A << 1;
            3'b101: result = A >> 1;
            default: result = 4'b0000;
        endcase
    end

    assign zero_flag = (result == 4'b0000);
    assign sign_flag = result[3];

endmodule
