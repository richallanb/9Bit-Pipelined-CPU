library verilog;
use verilog.vl_types.all;
entity mux_weird is
    port(
        input0          : in     vl_logic_vector(7 downto 0);
        input1          : in     vl_logic_vector(7 downto 0);
        input2          : in     vl_logic_vector(7 downto 0);
        input3          : in     vl_logic_vector(7 downto 0);
        select_hi       : in     vl_logic;
        select_lo       : in     vl_logic;
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end mux_weird;
