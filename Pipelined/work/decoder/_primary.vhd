library verilog;
use verilog.vl_types.all;
entity decoder is
    port(
        clk             : in     vl_logic;
        instruction     : in     vl_logic_vector(8 downto 0);
        reg1_banked     : out    vl_logic_vector(2 downto 0);
        reg2_banked     : out    vl_logic_vector(2 downto 0);
        reg_full        : out    vl_logic_vector(3 downto 0);
        immediate       : out    vl_logic_vector(7 downto 0);
        branch_imm      : out    vl_logic_vector(7 downto 0);
        reg_wr_banked   : out    vl_logic_vector(2 downto 0)
    );
end decoder;
