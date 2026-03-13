library verilog;
use verilog.vl_types.all;
entity instruction_memory is
    generic(
        DATA_WIDTH      : integer := 32;
        ADDR_WIDTH      : integer := 8
    );
    port(
        addr            : in     vl_logic_vector;
        instr           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of ADDR_WIDTH : constant is 1;
end instruction_memory;
