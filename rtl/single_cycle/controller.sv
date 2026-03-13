module controller(
    input  logic [6:0] opcode,
    input  logic [2:0] funct3,
    input  logic       funct7b5,
    input  logic       zero,
    output logic [1:0] result_src,
    output logic       mem_write,
    output logic       pc_src,
    output logic       alu_src,
    output logic       reg_write,
    output logic [1:0] imm_src,
    output logic [2:0] alu_ctrl
);

logic [1:0] alu_op;
logic branch;

main_controller mc(
    opcode,
    result_src,
    mem_write,
    branch,
    alu_src,
    reg_write,
    jump,
    imm_src,
    alu_op
);

alu_controller ac(
    opcode[5],
    funct3,
    funct7b5,
    alu_op,
    alu_ctrl
);

assign pc_src = (branch & zero) | jump;

endmodule