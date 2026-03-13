library verilog;
use verilog.vl_types.all;
entity alu is
    generic(
        DATA_WIDTH      : integer := 32
    );
    port(
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        alu_ctrl        : in     vl_logic_vector(2 downto 0);
        result          : out    vl_logic_vector;
        zero            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
end alu;
