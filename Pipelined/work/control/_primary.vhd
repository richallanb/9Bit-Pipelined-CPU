library verilog;
use verilog.vl_types.all;
entity control is
    port(
        instruction     : in     vl_logic_vector(8 downto 0);
        aro             : in     vl_logic_vector(1 downto 0);
        ldst            : in     vl_logic;
        NZCV            : in     vl_logic_vector(3 downto 0);
        ALUon           : out    vl_logic;
        fulladdr        : out    vl_logic;
        special_op      : out    vl_logic;
        special_func    : out    vl_logic_vector(2 downto 0);
        write_reg       : out    vl_logic;
        read_reg        : out    vl_logic;
        write_mem       : out    vl_logic;
        read_mem        : out    vl_logic;
        branch          : out    vl_logic;
        direct_flag     : out    vl_logic;
        reg_input_src   : out    vl_logic_vector(1 downto 0);
        mem_alu_src     : out    vl_logic;
        halt            : out    vl_logic;
        takeit          : out    vl_logic
    );
end control;
