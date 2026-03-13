`timescale 1ns/1ps

module controller_tb;

logic [31:0] instr;
logic zero;

logic [1:0] result_src;
logic mem_write;
logic pc_src;
logic alu_src;
logic reg_write;
logic jump;
logic [1:0] imm_src;
logic [2:0] alu_ctrl;

////////////////////////////////////////////////////////
// DUT
////////////////////////////////////////////////////////

controller dut(
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

////////////////////////////////////////////////////////
// Test
////////////////////////////////////////////////////////

initial begin

    instr = 32'h00500093;
    zero  = 0;

    #10;

    $display("Instruction = %h", instr);
    $display("opcode      = %b", instr[6:0]);
    $display("funct3      = %b", instr[14:12]);
    $display("funct7b5    = %b", instr[30]);

    $display("\nController outputs:");
    $display("reg_write   = %b", reg_write);
    $display("imm_src     = %b", imm_src);
    $display("alu_src     = %b", alu_src);
    $display("mem_write   = %b", mem_write);
    $display("result_src  = %b", result_src);
    $display("pc_src      = %b", pc_src);
    $display("alu_ctrl    = %b", alu_ctrl);

    #10;
    $finish;

end

endmodule