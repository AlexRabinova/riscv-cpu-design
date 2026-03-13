library verilog;
use verilog.vl_types.all;
entity register_file is
    generic(
        DATA_WIDTH      : integer := 32;
        REG_COUNT       : integer := 32;
        ADDR_WIDTH      : integer := 5
    );
    port(
        clk             : in     vl_logic;
        we              : in     vl_logic;
        rs1             : in     vl_logic_vector;
        rs2             : in     vl_logic_vector;
        rd              : in     vl_logic_vector;
        wd              : in     vl_logic_vector;
        rd1             : out    vl_logic_vector;
        rd2             : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of REG_COUNT : constant is 1;
    attribute mti_svvh_generic_type of ADDR_WIDTH : constant is 1;
end register_file;
