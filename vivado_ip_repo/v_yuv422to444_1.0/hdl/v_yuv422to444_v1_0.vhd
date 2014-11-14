library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity v_yuv422to444_v1_0 is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line

		-- Parameters of Axi Slave Bus Interface S_AXIS_VID_IN
		C_S_AXIS_VID_IN_TDATA_WIDTH	: integer	:= 16;

		-- Parameters of Axi Master Bus Interface M_AXIS_VID_OUT
		C_M_AXIS_VID_OUT_TDATA_WIDTH	: integer	:= 24
	);
	port (
		-- Users to add ports here
		aclk	: in std_logic;
        aresetn	: in std_logic;

		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface S_AXIS_VID_IN
--		s_axis_vid_in_aclk	: in std_logic;
--		s_axis_vid_in_aresetn	: in std_logic;
		s_axis_vid_in_tready	: out std_logic;
		s_axis_vid_in_tdata	: in std_logic_vector(C_S_AXIS_VID_IN_TDATA_WIDTH-1 downto 0);
		s_axis_vid_in_tuser	: in std_logic;
		s_axis_vid_in_tlast	: in std_logic;
		s_axis_vid_in_tvalid	: in std_logic;

		-- Ports of Axi Master Bus Interface M_AXIS_VID_OUT
--		m_axis_vid_out_aclk	: in std_logic;
--		m_axis_vid_out_aresetn	: in std_logic;
		m_axis_vid_out_tvalid	: out std_logic;
		m_axis_vid_out_tdata	: out std_logic_vector(C_M_AXIS_VID_OUT_TDATA_WIDTH-1 downto 0);
		m_axis_vid_out_tuser	: out std_logic;
		m_axis_vid_out_tlast	: out std_logic;
		m_axis_vid_out_tready	: in std_logic
	);
end v_yuv422to444_v1_0;

architecture arch_imp of v_yuv422to444_v1_0 is

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

signal f0_tdata, f1_tdata :  std_logic_vector(C_S_AXIS_VID_IN_TDATA_WIDTH-1 downto 0);
signal f0_tlast, f0_tuser, f1_tlast, f1_tuser : std_logic;
signal f0_wr, f0_empty, f0_full : std_logic;
signal f1_wr, f1_empty, f1_full : std_logic;
signal err, f01_rd : std_logic;
signal finidx, fin_full : std_logic;

signal    o_tdata :  std_logic_vector(C_M_AXIS_VID_OUT_TDATA_WIDTH-1 downto 0);   --! data to fifo
signal    o_tlast :  std_logic;
signal    o_tuser :  std_logic;
signal    o_wr, o_rd, o_empty, o_full, oidx :  std_logic;


begin

    ififo0: axis_fifo
    generic map (D_WIDTH => C_S_AXIS_VID_IN_TDATA_WIDTH)
    port map (
        rstn => aresetn, clk => aclk,
        din_tdata => s_axis_vid_in_tdata, din_tlast => s_axis_vid_in_tlast, din_tuser => s_axis_vid_in_tuser,
        wr => f0_wr,
        clear => err,
        dout_tdata => f0_tdata, dout_tlast => f0_tlast, dout_tuser => f0_tuser,
        rd => f01_rd,
        empty => f0_empty,
        full => f0_full,
        count => open
    );
    
    ififo1: axis_fifo
    generic map (D_WIDTH => C_S_AXIS_VID_IN_TDATA_WIDTH)
    port map (
        rstn => aresetn, clk => aclk,
        din_tdata => s_axis_vid_in_tdata, din_tlast => s_axis_vid_in_tlast, din_tuser => s_axis_vid_in_tuser,
        wr => f1_wr,
        clear => err,
        dout_tdata => f1_tdata, dout_tlast => f1_tlast, dout_tuser => f1_tuser,
        rd => f01_rd,
        empty => f1_empty,
        full => f1_full,
        count => open
    );

    fin_full <= f0_full or f1_full;
    s_axis_vid_in_tready <= not(fin_full);
    f0_wr <= not(finidx) and s_axis_vid_in_tvalid and not(fin_full);
    f1_wr <=    (finidx) and s_axis_vid_in_tvalid and not(fin_full);
      
    do_finidx: process (aclk)
    begin
        if rising_edge(aclk) then
            err <= '0';
            if aresetn='0' then
                finidx <= '0';
            else
                if (s_axis_vid_in_tvalid and not(fin_full)) = '1' then
                    -- currently accepting data
                    if s_axis_vid_in_tuser='1' then
                        -- SOF
                        -- finidx shall be 0 now.
                        if finidx /= '0' then
                            err <= '1';
                            -- finidx <= '0';
                        end if;
                        -- the NEXT pixel after SOF goes to slot 1
                        finidx <= '1';
                    else
                        -- not SOF (normal)
                        finidx <= not finidx;
                    end if;
                end if;
            end if;
        end if;
    end process;

    -------------------------


    doconv: process (aclk)
    begin
        if rising_edge(aclk) then
            if aresetn='0' or err='1' then
                oidx <= '0';
            else
                if o_wr='1' then
                    oidx <= not(oidx);
                end if;
            end if;
        end if;
    end process;

    o_tdata <= f1_tdata(15 downto 8) & f0_tdata(15 downto 8) & f0_tdata(7 downto 0)  when oidx='0' 
          else f1_tdata(15 downto 8) & f0_tdata(15 downto 8) & f1_tdata(7 downto 0);
    o_tlast <= f0_tlast when oidx='0' else f1_tlast;
    o_tuser <= f0_tuser when oidx='0' else f1_tuser;
    o_wr <= not(f0_empty or f1_empty or o_full or err);

    f01_rd <= o_wr and oidx;

    -------------------------

    ofifo: axis_fifo
    generic map (D_WIDTH => C_M_AXIS_VID_OUT_TDATA_WIDTH)
    port map (
        rstn => aresetn, clk => aclk,
        din_tdata => o_tdata, din_tlast => o_tlast, din_tuser => o_tuser,
        wr => o_wr,
        clear => '0',
        dout_tdata => m_axis_vid_out_tdata, dout_tlast => m_axis_vid_out_tlast, dout_tuser => m_axis_vid_out_tuser,
        rd => o_rd,
        empty => o_empty,
        full => o_full,
        count => open
    );

    m_axis_vid_out_tvalid <= not(o_empty);
    o_rd <= not(o_empty) and m_axis_vid_out_tready;
    
        
end arch_imp;
