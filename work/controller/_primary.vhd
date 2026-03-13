library verilog;
use verilog.vl_types.all;
entity controller is
    port(
        opcode          : in     vl_logic_vector(6 downto 0);
        funct3          : in     vl_logic_vector(2 downto 0);
        funct7b5        : in     vl_logic;
        zero            : in     vl_logic;
        result_src      : out    vl_logic_vector(1 downto 0);
        mem_write       : out    vl_logic;
        pc_src          : out    vl_logic;
        alu_src         : out    vl_logic;
        reg_write       : out    vl_logic;
        imm_src         : out    vl_logic_vector(1 downto 0);
        alu_ctrl        : out    vl_logic_vector(2 downto 0)
    );
end controller;
