library verilog;
use verilog.vl_types.all;
entity pc_schematic is
    port(
        clk             : in     vl_logic;
        taken           : out    vl_logic;
        halt            : out    vl_logic;
        con_spec_op     : out    vl_logic;
        con_write_reg   : out    vl_logic;
        con_read_reg    : out    vl_logic;
        reg_ldst        : out    vl_logic;
        branch          : out    vl_logic;
        alu_NZCV        : out    vl_logic_vector(3 downto 0);
        alu_reg1        : out    vl_logic_vector(7 downto 0);
        alu_reg2        : out    vl_logic_vector(7 downto 0);
        alu_result      : out    vl_logic_vector(7 downto 0);
        dec_full        : out    vl_logic_vector(3 downto 0);
        dec_imm         : out    vl_logic_vector(7 downto 0);
        dec_imm_br      : out    vl_logic_vector(7 downto 0);
        dec_r1          : out    vl_logic_vector(2 downto 0);
        dec_r2          : out    vl_logic_vector(2 downto 0);
        dec_rw          : out    vl_logic_vector(2 downto 0);
        dyn             : out    vl_logic_vector(32 downto 0);
        instr_out       : out    vl_logic_vector(8 downto 0);
        mem_addr        : out    vl_logic_vector(7 downto 0);
        mem_datain      : out    vl_logic_vector(7 downto 0);
        mem_out         : out    vl_logic_vector(7 downto 0);
        new_pc          : out    vl_logic_vector(7 downto 0);
        pc              : out    vl_logic_vector(7 downto 0);
        reg_aro         : out    vl_logic_vector(1 downto 0);
        reg_in          : out    vl_logic_vector(7 downto 0);
        reg_in_src      : out    vl_logic_vector(1 downto 0);
        reg_out1        : out    vl_logic_vector(7 downto 0);
        reg_out2        : out    vl_logic_vector(7 downto 0);
        special_func    : out    vl_logic_vector(2 downto 0);
        target_pc       : out    vl_logic_vector(7 downto 0)
    );
end pc_schematic;
