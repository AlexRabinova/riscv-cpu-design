module main_controller(
    input  logic [6:0] opcode,

    output logic [1:0] result_src,
    output logic       mem_write,
    output logic       branch,
    output logic       alu_src,
    output logic       reg_write,
    output logic       jump,
    output logic [1:0] imm_src,
    output logic [1:0] alu_op
);

always_comb begin

    case (opcode)

        // LOAD (lw)

        7'b0000011: begin
            reg_write  = 1;
            imm_src    = 2'b00;
            alu_src    = 1;
            mem_write  = 0;
            result_src = 2'b01;
            branch     = 0;
            alu_op     = 2'b00;
            jump       = 0;
        end


        // STORE (sw)

        7'b0100011: begin
            reg_write  = 0;
            imm_src    = 2'b01;
            alu_src    = 1;
            mem_write  = 1;
            result_src = 2'b00; // don't care, but keep defined
            branch     = 0;
            alu_op     = 2'b00;
            jump       = 0;
        end


        // R-TYPE

        7'b0110011: begin
            reg_write  = 1;
            imm_src    = 2'b00; // unused
            alu_src    = 0;
            mem_write  = 0;
            result_src = 2'b00;
            branch     = 0;
            alu_op     = 2'b10;
            jump       = 0;
        end


        // BRANCH (beq)

        7'b1100011: begin
            reg_write  = 0;
            imm_src    = 2'b10;
            alu_src    = 0;
            mem_write  = 0;
            result_src = 2'b00; // unused
            branch     = 1;
            alu_op     = 2'b01;
            jump       = 0;
        end


        // I-TYPE ALU (addi, ori, andi, slti)

        7'b0010011: begin
            reg_write  = 1;
            imm_src    = 2'b00;
            alu_src    = 1;
            mem_write  = 0;
            result_src = 2'b00;
            branch     = 0;
            alu_op     = 2'b10;
            jump       = 0;
        end

        // JAL

        7'b1101111: begin
            reg_write  = 1;
            imm_src    = 2'b11;
            alu_src    = 0;
            mem_write  = 0;
            result_src = 2'b10;
            branch     = 0;
            alu_op     = 2'b00;
            jump       = 1;
        end

        // No recognized opcode - 'x' for simulation

       default: begin
            reg_write  = 1'bx;
            imm_src    = 2'bxx;
            alu_src    = 1'bx;
            mem_write  = 1'bx;
            result_src = 2'bxx;
            branch     = 1'bx;
            alu_op     = 2'bxx;
            jump       = 1'bx;
        end

    endcase
end

endmodule