library verilog;
use verilog.vl_types.all;
entity prog1_ROM is
    port(
        clk             : in     vl_logic;
        pc              : in     vl_logic_vector(7 downto 0);
        instr_out       : out    vl_logic_vector(8 downto 0)
    );
end prog1_ROM;
