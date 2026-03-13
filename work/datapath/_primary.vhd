library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        reg_write       : in     vl_logic;
        alu_src         : in     vl_logic;
        mem_write       : in     vl_logic;
        result_src      : in     vl_logic_vector(1 downto 0);
        imm_src         : in     vl_logic_vector(1 downto 0);
        alu_ctrl        : in     vl_logic_vector(2 downto 0);
        pc_src          : in     vl_logic;
        zero            : out    vl_logic;
        instr           : out    vl_logic_vector(31 downto 0)
    );
end datapath;
