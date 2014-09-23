library verilog;
use verilog.vl_types.all;
entity mux4 is
    port(
        input1          : in     vl_logic_vector(7 downto 0);
        input2          : in     vl_logic_vector(7 downto 0);
        input3          : in     vl_logic_vector(7 downto 0);
        input4          : in     vl_logic_vector(7 downto 0);
        \select\        : in     vl_logic_vector(1 downto 0);
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end mux4;
