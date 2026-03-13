module imm_gen #(
    parameter WIDTH = 32
)(
    input  logic [31:0] instr,
    input  logic [1:0]  imm_src,
    output logic [WIDTH-1:0] imm
);

always_comb begin
    case (imm_src)

        // I-type
        2'b00:
            imm = {{20{instr[31]}}, instr[31:20]};

        // S-type
        2'b01:
            imm = {{20{instr[31]}}, instr[31:25], instr[11:7]};

        // B-type
        2'b10:
            imm = {{20{instr[31]}}, instr[7], instr[30:25],
                   instr[11:8], 1'b0};

        // J-type
        2'b11:
            imm = {{12{instr[31]}}, instr[19:12], instr[20],
                   instr[30:21], 1'b0};

        default:
            imm = 'x;

    endcase
end

endmodule