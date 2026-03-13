library verilog;
use verilog.vl_types.all;
entity data_memory is
    generic(
        DATA_WIDTH      : integer := 32;
        ADDR_WIDTH      : integer := 8
    );
    port(
        clk             : in     vl_logic;
        we              : in     vl_logic;
        a               : in     vl_logic_vector;
        wd              : in     vl_logic_vector;
        rd              : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of ADDR_WIDTH : constant is 1;
end data_memory;
