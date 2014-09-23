library verilog;
use verilog.vl_types.all;
entity pc_schematic_v is
    port(
        clk             : in     vl_logic;
        taken           : out    vl_logic;
        halt            : out    vl_logic;
        alu_NZCV        : out    vl_logic_vector(3 downto 0);
        alu_reg1        : out    vl_logic_vector(7 downto 0);
        alu_reg2        : out    vl_logic_vector(7 downto 0);
        alu_result      : out    vl_logic_vector(7 downto 0);
        instr_out       : out    vl_logic_vector(8 downto 0);
        pc              : out    vl_logic_vector(7 downto 0)
    );
end pc_schematic_v;
