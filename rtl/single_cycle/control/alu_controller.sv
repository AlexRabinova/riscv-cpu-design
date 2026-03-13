module alu_controller(
    input  logic       opb5,
    input  logic [2:0] funct3,
    input  logic       funct7b5,
    input  logic [1:0] alu_op,
    output logic [2:0] alu_ctrl
);

logic rtype_sub;

assign rtype_sub = funct7b5 & opb5;

always_comb
    case(alu_op)

        2'b00: alu_ctrl = 3'b000; // add
        2'b01: alu_ctrl = 3'b001; // sub (for branch)

        default: case(funct3)

            3'b000: begin
                if (rtype_sub)
                    alu_ctrl = 3'b001; // sub
                else
                    alu_ctrl = 3'b000; // add
            end

            3'b010: alu_ctrl = 3'b100; // slt
            3'b110: alu_ctrl = 3'b011; // or
            3'b111: alu_ctrl = 3'b010; // and

            default: alu_ctrl = 3'bxxx;

        endcase

    endcase

endmodule