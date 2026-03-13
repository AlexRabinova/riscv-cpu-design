library verilog;
use verilog.vl_types.all;
entity main_controller is
    port(
        opcode          : in     vl_logic_vector(6 downto 0);
        result_src      : out    vl_logic_vector(1 downto 0);
        mem_write       : out    vl_logic;
        branch          : out    vl_logic;
        alu_src         : out    vl_logic;
        reg_write       : out    vl_logic;
        jump            : out    vl_logic;
        imm_src         : out    vl_logic_vector(1 downto 0);
        alu_op          : out    vl_logic_vector(1 downto 0)
    );
end main_controller;
