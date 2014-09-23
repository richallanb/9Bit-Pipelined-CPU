library verilog;
use verilog.vl_types.all;
entity muxq is
    port(
        input1          : in     vl_logic_vector(7 downto 0);
        input2          : in     vl_logic_vector(7 downto 0);
        \select\        : in     vl_logic;
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end muxq;
