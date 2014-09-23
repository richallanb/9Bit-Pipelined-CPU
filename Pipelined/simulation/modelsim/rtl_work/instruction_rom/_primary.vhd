library verilog;
use verilog.vl_types.all;
entity instruction_rom is
    port(
        clk             : in     vl_logic;
        pc_line         : in     vl_logic_vector(7 downto 0);
        instr_out       : out    vl_logic_vector(8 downto 0)
    );
end instruction_rom;
