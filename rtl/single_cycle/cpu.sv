module cpu(
    input logic clk,
    input logic reset
);

logic [31:0] instr;
logic zero;

logic reg_write;
logic alu_src;
logic mem_write;
logic [1:0] result_src;
logic [1:0] imm_src;
logic [2:0] alu_ctrl;
logic pc_src;

////////////////////////////////////////////////////////////
// CONTROLLER
////////////////////////////////////////////////////////////

controller ctrl (
    .opcode(instr[6:0]),
    .funct3(instr[14:12]),
    .funct7b5(instr[30]),
    .zero(zero),
    .result_src(result_src),
    .mem_write(mem_write),
    .pc_src(pc_src),
    .alu_src(alu_src),
    .reg_write(reg_write),
    .imm_src(imm_src),
    .alu_ctrl(alu_ctrl)
);

////////////////////////////////////////////////////////////
// DATAPATH
////////////////////////////////////////////////////////////

datapath dp (
    .clk(clk),
    .reset(reset),

    .reg_write(reg_write),
    .alu_src(alu_src),
    .mem_write(mem_write),
    .result_src(result_src),
    .imm_src(imm_src),
    .alu_ctrl(alu_ctrl),
    .pc_src(pc_src),

    .zero(zero),
    .instr(instr)
);

endmodule