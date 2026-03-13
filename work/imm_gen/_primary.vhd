library verilog;
use verilog.vl_types.all;
entity imm_gen is
    generic(
        WIDTH           : integer := 32
    );
    port(
        instr           : in     vl_logic_vector(31 downto 0);
        imm_src         : in     vl_logic_vector(1 downto 0);
        imm             : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end imm_gen;
