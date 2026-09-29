`timescale 1ns/1ns

module cpu_tb;

logic clk;
logic reset;

/////////////////////////////////////////////////
// DUT
/////////////////////////////////////////////////

cpu dut (
    .clk(clk),
    .reset(reset)
);

/////////////////////////////////////////////////
// CLOCK
/////////////////////////////////////////////////

initial clk = 0;
always #5 clk = ~clk;

/////////////////////////////////////////////////
// RESET
/////////////////////////////////////////////////

initial begin
    reset = 1;
    #20;
    reset = 0;
end

/////////////////////////////////////////////////
// CYCLE COUNTER
/////////////////////////////////////////////////

int cycle = 0;

/////////////////////////////////////////////////
// FULL TRACE (MAIN DEBUG BLOCK)
/////////////////////////////////////////////////

always @(posedge clk) begin
    cycle++;

    $display("\n=================================================");
    $display("Cycle=%0d | Time=%0t | RESET=%0b", cycle, $time, reset);

    /////////////////////////
    // PC + INSTRUCTION
    /////////////////////////
    $display("PC=%h | PC_next=%h",
        dut.dp.pc,
        dut.dp.pc_next
    );

    $display("INSTR=%h", dut.instr);

    /////////////////////////
    // REGISTER FILE
    /////////////////////////
    $display("REGFILE:");
    $display("  A1=%0d RD1=%h",
        dut.instr[19:15],
        dut.dp.rd1
    );

    $display("  A2=%0d RD2=%h",
        dut.instr[24:20],
        dut.dp.rd2
    );

    $display("  A3=%0d WD3=%h",
        dut.instr[11:7],
        dut.dp.write_data
    );

    /////////////////////////
    // ALU
    /////////////////////////
    $display("ALU:");
    $display("  SrcA=%h | SrcB=%h",
        dut.dp.rd1,
        dut.dp.alu_src_b
    );

    $display("  ALUControl=%b | ALUResult=%h",
        dut.ctrl.alu_ctrl,
        dut.dp.alu_result
    );

    /////////////////////////
    // DATA MEMORY
    /////////////////////////
    $display("DATA MEMORY:");
    $display("  Addr=%h",
        dut.dp.alu_result
    );

    $display("  WriteData=%h | ReadData=%h",
        dut.dp.rd2,
        dut.dp.read_data
    );

    /////////////////////////
    // CONTROL SIGNALS (FULL)
    /////////////////////////
    $display("CONTROL:");

    $display("  result_src=%b | imm_src=%b",
        dut.ctrl.result_src,
        dut.ctrl.imm_src
    );

    $display("  alu_src=%b | alu_ctrl=%b",
        dut.ctrl.alu_src,
        dut.ctrl.alu_ctrl
    );

    $display("  reg_write=%b | mem_write=%b",
        dut.ctrl.reg_write,
        dut.ctrl.mem_write
    );

    $display("  pc_src=%b",
        dut.ctrl.pc_src
    );

end

/////////////////////////////////////////////////
// WRITE EVENTS 
/////////////////////////////////////////////////

always @(posedge clk) begin

    // Register write
    if (dut.ctrl.reg_write) begin
        $display(">>> REG WRITE: x%0d <= %h",
            dut.instr[11:7],
            dut.dp.write_data
        );
    end

    // Memory write
    if (dut.ctrl.mem_write) begin
        $display(">>> MEM WRITE: Addr=%h Data=%h",
            dut.dp.alu_result,
            dut.dp.rd2
        );
    end

end

/////////////////////////////////////////////////
// STOP SIMULATION
/////////////////////////////////////////////////

initial begin
    #300;
    $finish;
end

endmodule