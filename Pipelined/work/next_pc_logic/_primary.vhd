library verilog;
use verilog.vl_types.all;
entity next_pc_logic is
    port(
        clk             : in     vl_logic;
        start           : in     vl_logic;
        currentpc       : in     vl_logic_vector(7 downto 0);
        target          : in     vl_logic_vector(7 downto 0);
        taken           : in     vl_logic;
        branch          : in     vl_logic;
        pc_o            : out    vl_logic_vector(7 downto 0)
    );
end next_pc_logic;
