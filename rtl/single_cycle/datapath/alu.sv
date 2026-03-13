module alu #(
    parameter DATA_WIDTH = 32
)(
    input  logic [DATA_WIDTH-1:0] a,
    input  logic [DATA_WIDTH-1:0] b,
    input  logic [2:0]            alu_ctrl,
    output logic [DATA_WIDTH-1:0] result,
    output logic                  zero
);

always_comb begin
    case (alu_ctrl)

        3'b000: result = a + b;                // ADD
        3'b001: result = a - b;                // SUB
        3'b010: result = a & b;                // AND
        3'b011: result = a | b;                // OR
        3'b100: result = ($signed(a) < $signed(b)) ? 32'd1 : '0; // SLT
        default: result = 'x;

    endcase
end

assign zero = (result == 0);

endmodule