`timescale 1ns/1ps

module datapath_tb;

/////////////////////////////////////////////////
// Signals
/////////////////////////////////////////////////

logic clk;
logic reset;

logic reg_write;
logic alu_src;
logic mem_write;
logic [1:0] result_src;
logic [1:0] imm_src;
logic [2:0] alu_ctrl;
logic pc_src;

logic zero;
logic [31:0] instr;

/////////////////////////////////////////////////
// DUT
/////////////////////////////////////////////////

datapath dut (
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

/////////////////////////////////////////////////
// CLOCK
/////////////////////////////////////////////////

initial clk = 0;
always #5 clk = ~clk;   // 10ns clock

/////////////////////////////////////////////////
// RESET + STIMULUS
/////////////////////////////////////////////////

initial begin

    // default control signals
    reg_write = 0;
    alu_src   = 0;
    mem_write = 0;
    result_src = 0;
    imm_src   = 0;
    alu_ctrl  = 0;
    pc_src    = 0;

    // apply reset
    reset = 1;
    #20;
    reset = 0;

    // run simulation
    #200;

    $display("Simulation finished.");
    $finish;

end

/////////////////////////////////////////////////
// MONITOR
/////////////////////////////////////////////////

always @(posedge clk)
begin
    $display("time=%0t  PC=%h  instr=%h",
              $time,
              dut.pc,
              instr);
end

endmodule