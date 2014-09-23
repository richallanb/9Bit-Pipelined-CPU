library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        aro             : in     vl_logic_vector(1 downto 0);
        special_op      : in     vl_logic;
        special_func    : in     vl_logic_vector(2 downto 0);
        reg1            : in     vl_logic_vector(7 downto 0);
        reg2            : in     vl_logic_vector(7 downto 0);
        reg3            : in     vl_logic_vector(7 downto 0);
        reg4            : in     vl_logic_vector(7 downto 0);
        ALUon           : in     vl_logic;
        result          : out    vl_logic_vector(7 downto 0);
        NZCV            : out    vl_logic_vector(3 downto 0);
        tally_count     : out    vl_logic_vector(8 downto 0)
    );
end alu;
