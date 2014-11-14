library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity bitcrop_v1_0 is
	generic (
		-- Parameters of Axi Slave Bus Interface S_AXI
		C_S_AXI_TDATA_WIDTH	: integer	:= 32;

		-- Parameters of Axi Master Bus Interface M_AXI
		C_M_AXI_TDATA_WIDTH	: integer	:= 32
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
		s_axi_tvalid : in std_logic;

		-- Ports of Axi Master Bus Interface M_AXI
		m_axi_tvalid	: out std_logic;
		m_axi_tdata	: out std_logic_vector(C_M_AXI_TDATA_WIDTH-1 downto 0);
		m_axi_tuser	: out std_logic;
		m_axi_tlast	: out std_logic;
		m_axi_tready	: in std_logic
	);
end bitcrop_v1_0;

architecture arch_imp of bitcrop_v1_0 is


begin
    s_axi_tready <= m_axi_tready;
    m_axi_tvalid <= s_axi_tvalid;
    m_axi_tuser <=  s_axi_tuser;
    m_axi_tlast <= s_axi_tlast;

    dt: process (s_axi_tdata)
    begin
        m_axi_tdata <= (others => '0');
        if C_M_AXI_TDATA_WIDTH >= C_S_AXI_TDATA_WIDTH then
            -- extend with zeros
            m_axi_tdata(C_S_AXI_TDATA_WIDTH-1 downto 0) <= s_axi_tdata;
        else
            -- trim
            m_axi_tdata <= s_axi_tdata(C_M_AXI_TDATA_WIDTH-1 downto 0);
        end if;
    end process;
end arch_imp;
