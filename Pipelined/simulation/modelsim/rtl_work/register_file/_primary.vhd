library verilog;
use verilog.vl_types.all;
entity register_file is
    port(
        CLK             : in     vl_logic;
        write_reg       : in     vl_logic;
        read_reg        : in     vl_logic;
        reg_src1        : in     vl_logic_vector(2 downto 0);
        reg_src2        : in     vl_logic_vector(2 downto 0);
        write_reg_src   : in     vl_logic_vector(2 downto 0);
        write_reg_full  : in     vl_logic_vector(3 downto 0);
        data_in         : in     vl_logic_vector(7 downto 0);
        special_op      : in     vl_logic;
        special_func    : in     vl_logic_vector(2 downto 0);
        full_addr       : in     vl_logic;
        full_reg_src    : in     vl_logic_vector(3 downto 0);
        data1           : out    vl_logic_vector(7 downto 0);
        data2           : out    vl_logic_vector(7 downto 0);
        data3           : out    vl_logic_vector(7 downto 0);
        data4           : out    vl_logic_vector(7 downto 0);
        aro             : out    vl_logic_vector(1 downto 0);
        ldst            : out    vl_logic
    );
end register_file;
