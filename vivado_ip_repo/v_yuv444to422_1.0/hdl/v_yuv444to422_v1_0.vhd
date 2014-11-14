library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity v_yuv444to422_v1_0 is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface S_AXI
		C_S_AXI_TDATA_WIDTH	: integer	:= 24;

		-- Parameters of Axi Master Bus Interface M_AXIS
		C_M_AXIS_TDATA_WIDTH	: integer	:= 16
	);
	port (
		-- Users to add ports here
		aclk	: in std_logic;
        aresetn	: in std_logic;

		-- Ports of Axi Slave Bus Interface S_AXI
		s_axi_tready	: out std_logic;
		s_axi_tdata	: in std_logic_vector(C_S_AXI_TDATA_WIDTH-1 downto 0);
		s_axi_tuser	: in std_logic;
		s_axi_tlast	: in std_logic;
		s_axi_tvalid	: in std_logic;

		-- Ports of Axi Master Bus Interface M_AXIS
		m_axis_tvalid	: out std_logic;
		m_axis_tdata	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
		m_axis_tuser	: out std_logic;
		m_axis_tlast	: out std_logic;
		m_axis_tready	: in std_logic
	);
end v_yuv444to422_v1_0;

architecture arch_imp of v_yuv444to422_v1_0 is

component axis_fifo is
generic ( 
    LENGTH    : natural := 16;                          --! FIFO length
    D_WIDTH   : positive := 32;                         --! FIFO data width
    CNT_WIDTH : positive := 5;                          --! width of the count output
    ASYNCM    : boolean := true                         --! use asynchronous memory? Forces distributed-mem implementation.
);
port ( 
    rstn  : in  std_logic;                              --! fifo reset, active low
    clk   : in  std_logic;                              --! clock signal
    -- FIFO input
    din_tdata : in  std_logic_vector(D_WIDTH-1 downto 0);   --! data to fifo
    din_tlast : in std_logic;
    din_tuser : in std_logic;
    wr    : in  std_logic;                              --! write strobe signal
    clear : in  std_logic;                              --! clear (reset) the fifo
    -- FIFO output
    dout_tdata  : out std_logic_vector(D_WIDTH-1 downto 0);   --! data from fifo
    dout_tlast : out std_logic;
    dout_tuser : out std_logic;
    rd    : in  std_logic;                              --! read strobe signal
    -- FIFO state
    empty : out std_logic;                              --! fifo empty flag
    full  : out std_logic;                              --!  fifo full flag
    count : out std_logic_vector(CNT_WIDTH-1 downto 0) --! current number of words in the fifo
);
end component;


signal    o_tdata :  std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);   --! data to fifo
signal    o_tlast :  std_logic;
signal    o_tuser :  std_logic;
signal    o_wr, o_rd, o_empty, o_full :  std_logic;

signal  idx : std_logic;

begin

    o_tlast <= s_axi_tlast; 
    o_tuser <= s_axi_tuser;
    o_wr <= not(o_full) and s_axi_tvalid;
    s_axi_tready <= not(o_full);

    ff: process (aclk)
    begin
        if rising_edge(aclk) then
            if aresetn='0' then
                idx <= '0';
            else
                if o_wr='1' then
                    -- data has been received
                    idx <= not(idx);
                    if s_axi_tuser='1' then
                        -- SOF is always at zero, hence the next is at one.
                        idx <= '1';
                    end if;
                end if;
            end if;
        end if;
    end process;
    
    otdatawr: process (s_axi_tdata, idx)
    begin
        o_tdata(7 downto 0) <= s_axi_tdata(7 downto 0);     -- luma
        if idx='0' then
            -- output U
            o_tdata(15 downto 8) <= s_axi_tdata(15 downto 8);
        else
            -- output V
            o_tdata(15 downto 8) <= s_axi_tdata(23 downto 16);
        end if;
    end process;
    
--------------
    ofifo: axis_fifo
    generic map (D_WIDTH => C_M_AXIS_TDATA_WIDTH)
    port map (
        rstn => aresetn, clk => aclk,
        din_tdata => o_tdata, din_tlast => o_tlast, din_tuser => o_tuser,
        wr => o_wr,
        clear => '0',
        dout_tdata => m_axis_tdata, dout_tlast => m_axis_tlast, dout_tuser => m_axis_tuser,
        rd => o_rd,
        empty => o_empty,
        full => o_full,
        count => open
    );

    m_axis_tvalid <= not(o_empty);
    o_rd <= not(o_empty) and m_axis_tready;


end arch_imp;
