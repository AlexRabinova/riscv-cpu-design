module alu_controller(
    input  logic       opb5,
    input  logic [2:0] funct3,
    input  logic       funct7b5,
    input  logic [1:0] alu_op,
    output logic [2:0] alu_ctrl
);

logic rtype_sub;

assign rtype_sub = funct7b5 & opb5;

always_comb begin
    case (alu_op)

        2'b00: alu_ctrl = 3'b000; // add (lw, sw)

        2'b01: alu_ctrl = 3'b001; // sub (beq)

        2'b10: begin
            case (funct3)

                // ADD / SUB
                3'b000: begin
                    if (rtype_sub)
                        alu_ctrl = 3'b001; // sub
                    else
                        alu_ctrl = 3'b000; // add
                end

                // SLT
                3'b010: alu_ctrl = 3'b101;

                // OR
                3'b110: alu_ctrl = 3'b011;

                // AND
                3'b111: alu_ctrl = 3'b010;

                // XOR
                3'b100: alu_ctrl = 3'b100;

                default: alu_ctrl = 3'bxxx;

            endcase
        end

        default: alu_ctrl = 3'bxxx;

    endcase
end

endmodule