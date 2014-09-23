library verilog;
use verilog.vl_types.all;
entity program_counter is
    port(
        newpc_i         : in     vl_logic_vector(7 downto 0);
        clock           : in     vl_logic;
        wenable_i       : in     vl_logic;
        reset_i         : in     vl_logic;
        pc_o            : out    vl_logic_vector(7 downto 0)
    );
end program_counter;
