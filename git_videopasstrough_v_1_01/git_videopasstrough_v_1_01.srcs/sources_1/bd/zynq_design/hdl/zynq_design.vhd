--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.2 (win64) Build 932637 Wed Jun 11 13:33:10 MDT 2014
--Date        : Fri Nov 14 01:23:39 2014
--Host        : laptop running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target zynq_design.bd
--Design      : zynq_design
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zynq_design is
  port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    HDMI_clk : out STD_LOGIC;
    HDMI_data : out STD_LOGIC_VECTOR ( 15 downto 0 );
    HDMI_data_en : out STD_LOGIC;
    HDMI_hsync : out STD_LOGIC;
    HDMI_vsync : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of zynq_design : entity is "zynq_design,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLanguage=VHDL,numBlks=9,numReposBlks=9,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,da_ps7_cnt=1}";
end zynq_design;

architecture STRUCTURE of zynq_design is
  component zynq_design_processing_system7_0_0 is
  port (
    TTC0_WAVE0_OUT : out STD_LOGIC;
    TTC0_WAVE1_OUT : out STD_LOGIC;
    TTC0_WAVE2_OUT : out STD_LOGIC;
    USB0_PORT_INDCTL : out STD_LOGIC_VECTOR ( 1 downto 0 );
    USB0_VBUS_PWRSELECT : out STD_LOGIC;
    USB0_VBUS_PWRFAULT : in STD_LOGIC;
    M_AXI_GP0_ARVALID : out STD_LOGIC;
    M_AXI_GP0_AWVALID : out STD_LOGIC;
    M_AXI_GP0_BREADY : out STD_LOGIC;
    M_AXI_GP0_RREADY : out STD_LOGIC;
    M_AXI_GP0_WLAST : out STD_LOGIC;
    M_AXI_GP0_WVALID : out STD_LOGIC;
    M_AXI_GP0_ARID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_AWID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_WID : out STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_GP0_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_GP0_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ARLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWLEN : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_GP0_ACLK : in STD_LOGIC;
    M_AXI_GP0_ARREADY : in STD_LOGIC;
    M_AXI_GP0_AWREADY : in STD_LOGIC;
    M_AXI_GP0_BVALID : in STD_LOGIC;
    M_AXI_GP0_RLAST : in STD_LOGIC;
    M_AXI_GP0_RVALID : in STD_LOGIC;
    M_AXI_GP0_WREADY : in STD_LOGIC;
    M_AXI_GP0_BID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_RID : in STD_LOGIC_VECTOR ( 11 downto 0 );
    M_AXI_GP0_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_GP0_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FCLK_CLK0 : out STD_LOGIC;
    FCLK_RESET0_N : out STD_LOGIC;
    MIO : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    DDR_CAS_n : inout STD_LOGIC;
    DDR_CKE : inout STD_LOGIC;
    DDR_Clk_n : inout STD_LOGIC;
    DDR_Clk : inout STD_LOGIC;
    DDR_CS_n : inout STD_LOGIC;
    DDR_DRSTB : inout STD_LOGIC;
    DDR_ODT : inout STD_LOGIC;
    DDR_RAS_n : inout STD_LOGIC;
    DDR_WEB : inout STD_LOGIC;
    DDR_BankAddr : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_Addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_VRN : inout STD_LOGIC;
    DDR_VRP : inout STD_LOGIC;
    DDR_DM : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_DQ : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_DQS_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_DQS : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    PS_SRSTB : inout STD_LOGIC;
    PS_CLK : inout STD_LOGIC;
    PS_PORB : inout STD_LOGIC
  );
  end component zynq_design_processing_system7_0_0;
  component zynq_design_v_tpg_0_0 is
  port (
    aclk : in STD_LOGIC;
    aclken : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_video_tdata : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axis_video_tvalid : out STD_LOGIC;
    m_axis_video_tready : in STD_LOGIC;
    m_axis_video_tlast : out STD_LOGIC;
    m_axis_video_tuser : out STD_LOGIC
  );
  end component zynq_design_v_tpg_0_0;
  component zynq_design_bitcrop_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_tdata : in STD_LOGIC_VECTOR ( 23 downto 0 );
    s_axi_tuser : in STD_LOGIC;
    s_axi_tlast : in STD_LOGIC;
    s_axi_tvalid : in STD_LOGIC;
    s_axi_tready : out STD_LOGIC;
    m_axi_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_tuser : out STD_LOGIC;
    m_axi_tlast : out STD_LOGIC;
    m_axi_tvalid : out STD_LOGIC;
    m_axi_tready : in STD_LOGIC
  );
  end component zynq_design_bitcrop_0_0;
  component zynq_design_bitcrop_1_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_tuser : in STD_LOGIC;
    s_axi_tlast : in STD_LOGIC;
    s_axi_tvalid : in STD_LOGIC;
    s_axi_tready : out STD_LOGIC;
    m_axi_tdata : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axi_tuser : out STD_LOGIC;
    m_axi_tlast : out STD_LOGIC;
    m_axi_tvalid : out STD_LOGIC;
    m_axi_tready : in STD_LOGIC
  );
  end component zynq_design_bitcrop_1_0;
  component zynq_design_v_rgb2ycrcb_0_0 is
  port (
    aclk : in STD_LOGIC;
    aclken : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_video_tdata : in STD_LOGIC_VECTOR ( 23 downto 0 );
    s_axis_video_tready : out STD_LOGIC;
    s_axis_video_tvalid : in STD_LOGIC;
    s_axis_video_tlast : in STD_LOGIC;
    s_axis_video_tuser_sof : in STD_LOGIC;
    m_axis_video_tdata : out STD_LOGIC_VECTOR ( 23 downto 0 );
    m_axis_video_tvalid : out STD_LOGIC;
    m_axis_video_tready : in STD_LOGIC;
    m_axis_video_tlast : out STD_LOGIC;
    m_axis_video_tuser_sof : out STD_LOGIC
  );
  end component zynq_design_v_rgb2ycrcb_0_0;
  component zynq_design_v_yuv444to422_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tuser : out STD_LOGIC;
    m_axis_tlast : out STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    s_axi_tdata : in STD_LOGIC_VECTOR ( 23 downto 0 );
    s_axi_tuser : in STD_LOGIC;
    s_axi_tlast : in STD_LOGIC;
    s_axi_tvalid : in STD_LOGIC;
    s_axi_tready : out STD_LOGIC
  );
  end component zynq_design_v_yuv444to422_0_0;
  component zynq_design_v_axi4s_vid_out_0_0 is
  port (
    aclk : in STD_LOGIC;
    rst : in STD_LOGIC;
    aclken : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_video_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_video_tvalid : in STD_LOGIC;
    s_axis_video_tready : out STD_LOGIC;
    s_axis_video_tuser : in STD_LOGIC;
    s_axis_video_tlast : in STD_LOGIC;
    fid : in STD_LOGIC;
    vid_io_out_clk : in STD_LOGIC;
    vid_io_out_ce : in STD_LOGIC;
    vid_active_video : out STD_LOGIC;
    vid_vsync : out STD_LOGIC;
    vid_hsync : out STD_LOGIC;
    vid_vblank : out STD_LOGIC;
    vid_hblank : out STD_LOGIC;
    vid_field_id : out STD_LOGIC;
    vid_data : out STD_LOGIC_VECTOR ( 15 downto 0 );
    vtg_vsync : in STD_LOGIC;
    vtg_hsync : in STD_LOGIC;
    vtg_vblank : in STD_LOGIC;
    vtg_hblank : in STD_LOGIC;
    vtg_active_video : in STD_LOGIC;
    vtg_field_id : in STD_LOGIC;
    vtg_ce : out STD_LOGIC;
    locked : out STD_LOGIC;
    wr_error : out STD_LOGIC;
    empty : out STD_LOGIC
  );
  end component zynq_design_v_axi4s_vid_out_0_0;
  component zynq_design_v_tc_0_0 is
  port (
    clk : in STD_LOGIC;
    clken : in STD_LOGIC;
    gen_clken : in STD_LOGIC;
    hsync_out : out STD_LOGIC;
    hblank_out : out STD_LOGIC;
    vsync_out : out STD_LOGIC;
    vblank_out : out STD_LOGIC;
    active_video_out : out STD_LOGIC;
    resetn : in STD_LOGIC;
    fsync_out : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component zynq_design_v_tc_0_0;
  component zynq_design_xlconstant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component zynq_design_xlconstant_0_0;
  signal GND_1 : STD_LOGIC;
  signal bitcrop_0_M_AXI_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute MARK_DEBUG : boolean;
  attribute MARK_DEBUG of bitcrop_0_M_AXI_TDATA : signal is std.standard.true;
  signal bitcrop_0_M_AXI_TLAST : STD_LOGIC;
  attribute MARK_DEBUG of bitcrop_0_M_AXI_TLAST : signal is std.standard.true;
  signal bitcrop_0_M_AXI_TREADY : STD_LOGIC;
  attribute MARK_DEBUG of bitcrop_0_M_AXI_TREADY : signal is std.standard.true;
  signal bitcrop_0_M_AXI_TUSER : STD_LOGIC;
  attribute MARK_DEBUG of bitcrop_0_M_AXI_TUSER : signal is std.standard.true;
  signal bitcrop_0_M_AXI_TVALID : STD_LOGIC;
  attribute MARK_DEBUG of bitcrop_0_M_AXI_TVALID : signal is std.standard.true;
  signal bitcrop_1_M_AXI_TDATA : STD_LOGIC_VECTOR ( 23 downto 0 );
  attribute MARK_DEBUG of bitcrop_1_M_AXI_TDATA : signal is std.standard.true;
  signal bitcrop_1_M_AXI_TLAST : STD_LOGIC;
  attribute MARK_DEBUG of bitcrop_1_M_AXI_TLAST : signal is std.standard.true;
  signal bitcrop_1_M_AXI_TREADY : STD_LOGIC;
  attribute MARK_DEBUG of bitcrop_1_M_AXI_TREADY : signal is std.standard.true;
  signal bitcrop_1_M_AXI_TUSER : STD_LOGIC;
  attribute MARK_DEBUG of bitcrop_1_M_AXI_TUSER : signal is std.standard.true;
  signal bitcrop_1_M_AXI_TVALID : STD_LOGIC;
  attribute MARK_DEBUG of bitcrop_1_M_AXI_TVALID : signal is std.standard.true;
  signal processing_system7_0_DDR_ADDR : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal processing_system7_0_DDR_BA : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_DDR_CAS_N : STD_LOGIC;
  signal processing_system7_0_DDR_CKE : STD_LOGIC;
  signal processing_system7_0_DDR_CK_N : STD_LOGIC;
  signal processing_system7_0_DDR_CK_P : STD_LOGIC;
  signal processing_system7_0_DDR_CS_N : STD_LOGIC;
  signal processing_system7_0_DDR_DM : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_DDR_DQ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_DDR_DQS_N : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_DDR_DQS_P : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_DDR_ODT : STD_LOGIC;
  signal processing_system7_0_DDR_RAS_N : STD_LOGIC;
  signal processing_system7_0_DDR_RESET_N : STD_LOGIC;
  signal processing_system7_0_DDR_WE_N : STD_LOGIC;
  signal processing_system7_0_FCLK_CLK0 : STD_LOGIC;
  signal processing_system7_0_FCLK_RESET0_N : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_DDR_VRN : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_DDR_VRP : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_MIO : STD_LOGIC_VECTOR ( 53 downto 0 );
  signal processing_system7_0_FIXED_IO_PS_CLK : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_PS_PORB : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_PS_SRSTB : STD_LOGIC;
  signal v_axi4s_vid_out_0_vid_active_video : STD_LOGIC;
  signal v_axi4s_vid_out_0_vid_data : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal v_axi4s_vid_out_0_vid_hsync : STD_LOGIC;
  signal v_axi4s_vid_out_0_vid_vsync : STD_LOGIC;
  signal v_axi4s_vid_out_0_vtg_ce : STD_LOGIC;
  signal v_rgb2ycrcb_0_video_out_TDATA : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal v_rgb2ycrcb_0_video_out_TLAST : STD_LOGIC;
  signal v_rgb2ycrcb_0_video_out_TREADY : STD_LOGIC;
  signal v_rgb2ycrcb_0_video_out_TUSER : STD_LOGIC;
  signal v_rgb2ycrcb_0_video_out_TVALID : STD_LOGIC;
  signal v_tc_0_vtiming_out_ACTIVE_VIDEO : STD_LOGIC;
  signal v_tc_0_vtiming_out_HBLANK : STD_LOGIC;
  signal v_tc_0_vtiming_out_HSYNC : STD_LOGIC;
  signal v_tc_0_vtiming_out_VBLANK : STD_LOGIC;
  signal v_tc_0_vtiming_out_VSYNC : STD_LOGIC;
  signal v_tpg_0_video_out_TDATA : STD_LOGIC_VECTOR ( 23 downto 0 );
  attribute MARK_DEBUG of v_tpg_0_video_out_TDATA : signal is std.standard.true;
  signal v_tpg_0_video_out_TLAST : STD_LOGIC;
  attribute MARK_DEBUG of v_tpg_0_video_out_TLAST : signal is std.standard.true;
  signal v_tpg_0_video_out_TREADY : STD_LOGIC;
  attribute MARK_DEBUG of v_tpg_0_video_out_TREADY : signal is std.standard.true;
  signal v_tpg_0_video_out_TUSER : STD_LOGIC;
  attribute MARK_DEBUG of v_tpg_0_video_out_TUSER : signal is std.standard.true;
  signal v_tpg_0_video_out_TVALID : STD_LOGIC;
  attribute MARK_DEBUG of v_tpg_0_video_out_TVALID : signal is std.standard.true;
  signal v_yuv444to422_0_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal v_yuv444to422_0_M_AXIS_TLAST : STD_LOGIC;
  signal v_yuv444to422_0_M_AXIS_TREADY : STD_LOGIC;
  signal v_yuv444to422_0_M_AXIS_TUSER : STD_LOGIC;
  signal v_yuv444to422_0_M_AXIS_TVALID : STD_LOGIC;
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_ARVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_M_AXI_GP0_AWVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_M_AXI_GP0_BREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_M_AXI_GP0_RREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_M_AXI_GP0_WLAST_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_M_AXI_GP0_WVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_TTC0_WAVE0_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_TTC0_WAVE1_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_TTC0_WAVE2_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_USB0_VBUS_PWRSELECT_UNCONNECTED : STD_LOGIC;
  signal NLW_processing_system7_0_M_AXI_GP0_ARADDR_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_ARBURST_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_ARCACHE_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_ARID_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_ARLEN_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_ARLOCK_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_ARPROT_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_ARQOS_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_ARSIZE_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_AWADDR_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_AWBURST_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_AWCACHE_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_AWID_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_AWLEN_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_AWLOCK_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_AWPROT_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_AWQOS_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_AWSIZE_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_WDATA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_WID_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_processing_system7_0_M_AXI_GP0_WSTRB_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_processing_system7_0_USB0_PORT_INDCTL_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_v_axi4s_vid_out_0_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_v_axi4s_vid_out_0_locked_UNCONNECTED : STD_LOGIC;
  signal NLW_v_axi4s_vid_out_0_vid_field_id_UNCONNECTED : STD_LOGIC;
  signal NLW_v_axi4s_vid_out_0_vid_hblank_UNCONNECTED : STD_LOGIC;
  signal NLW_v_axi4s_vid_out_0_vid_vblank_UNCONNECTED : STD_LOGIC;
  signal NLW_v_axi4s_vid_out_0_wr_error_UNCONNECTED : STD_LOGIC;
  signal NLW_v_tc_0_fsync_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  HDMI_clk <= processing_system7_0_FCLK_CLK0;
  HDMI_data(15 downto 0) <= v_axi4s_vid_out_0_vid_data(15 downto 0);
  HDMI_data_en <= v_axi4s_vid_out_0_vid_active_video;
  HDMI_hsync <= v_axi4s_vid_out_0_vid_hsync;
  HDMI_vsync <= v_axi4s_vid_out_0_vid_vsync;
GND: unisim.vcomponents.GND
    port map (
      G => GND_1
    );
bitcrop_0: component zynq_design_bitcrop_0_0
    port map (
      aclk => processing_system7_0_FCLK_CLK0,
      aresetn => processing_system7_0_FCLK_RESET0_N,
      m_axi_tdata(31 downto 0) => bitcrop_0_M_AXI_TDATA(31 downto 0),
      m_axi_tlast => bitcrop_0_M_AXI_TLAST,
      m_axi_tready => bitcrop_0_M_AXI_TREADY,
      m_axi_tuser => bitcrop_0_M_AXI_TUSER,
      m_axi_tvalid => bitcrop_0_M_AXI_TVALID,
      s_axi_tdata(23 downto 0) => v_tpg_0_video_out_TDATA(23 downto 0),
      s_axi_tlast => v_tpg_0_video_out_TLAST,
      s_axi_tready => v_tpg_0_video_out_TREADY,
      s_axi_tuser => v_tpg_0_video_out_TUSER,
      s_axi_tvalid => v_tpg_0_video_out_TVALID
    );
bitcrop_1: component zynq_design_bitcrop_1_0
    port map (
      aclk => processing_system7_0_FCLK_CLK0,
      aresetn => processing_system7_0_FCLK_RESET0_N,
      m_axi_tdata(23 downto 0) => bitcrop_1_M_AXI_TDATA(23 downto 0),
      m_axi_tlast => bitcrop_1_M_AXI_TLAST,
      m_axi_tready => bitcrop_1_M_AXI_TREADY,
      m_axi_tuser => bitcrop_1_M_AXI_TUSER,
      m_axi_tvalid => bitcrop_1_M_AXI_TVALID,
      s_axi_tdata(31 downto 0) => bitcrop_0_M_AXI_TDATA(31 downto 0),
      s_axi_tlast => bitcrop_0_M_AXI_TLAST,
      s_axi_tready => bitcrop_0_M_AXI_TREADY,
      s_axi_tuser => bitcrop_0_M_AXI_TUSER,
      s_axi_tvalid => bitcrop_0_M_AXI_TVALID
    );
processing_system7_0: component zynq_design_processing_system7_0_0
    port map (
      DDR_Addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_BankAddr(2 downto 0) => DDR_ba(2 downto 0),
      DDR_CAS_n => DDR_cas_n,
      DDR_CKE => DDR_cke,
      DDR_CS_n => DDR_cs_n,
      DDR_Clk => DDR_ck_p,
      DDR_Clk_n => DDR_ck_n,
      DDR_DM(3 downto 0) => DDR_dm(3 downto 0),
      DDR_DQ(31 downto 0) => DDR_dq(31 downto 0),
      DDR_DQS(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_DQS_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_DRSTB => DDR_reset_n,
      DDR_ODT => DDR_odt,
      DDR_RAS_n => DDR_ras_n,
      DDR_VRN => FIXED_IO_ddr_vrn,
      DDR_VRP => FIXED_IO_ddr_vrp,
      DDR_WEB => DDR_we_n,
      FCLK_CLK0 => processing_system7_0_FCLK_CLK0,
      FCLK_RESET0_N => processing_system7_0_FCLK_RESET0_N,
      MIO(53 downto 0) => FIXED_IO_mio(53 downto 0),
      M_AXI_GP0_ACLK => processing_system7_0_FCLK_CLK0,
      M_AXI_GP0_ARADDR(31 downto 0) => NLW_processing_system7_0_M_AXI_GP0_ARADDR_UNCONNECTED(31 downto 0),
      M_AXI_GP0_ARBURST(1 downto 0) => NLW_processing_system7_0_M_AXI_GP0_ARBURST_UNCONNECTED(1 downto 0),
      M_AXI_GP0_ARCACHE(3 downto 0) => NLW_processing_system7_0_M_AXI_GP0_ARCACHE_UNCONNECTED(3 downto 0),
      M_AXI_GP0_ARID(11 downto 0) => NLW_processing_system7_0_M_AXI_GP0_ARID_UNCONNECTED(11 downto 0),
      M_AXI_GP0_ARLEN(3 downto 0) => NLW_processing_system7_0_M_AXI_GP0_ARLEN_UNCONNECTED(3 downto 0),
      M_AXI_GP0_ARLOCK(1 downto 0) => NLW_processing_system7_0_M_AXI_GP0_ARLOCK_UNCONNECTED(1 downto 0),
      M_AXI_GP0_ARPROT(2 downto 0) => NLW_processing_system7_0_M_AXI_GP0_ARPROT_UNCONNECTED(2 downto 0),
      M_AXI_GP0_ARQOS(3 downto 0) => NLW_processing_system7_0_M_AXI_GP0_ARQOS_UNCONNECTED(3 downto 0),
      M_AXI_GP0_ARREADY => GND_1,
      M_AXI_GP0_ARSIZE(2 downto 0) => NLW_processing_system7_0_M_AXI_GP0_ARSIZE_UNCONNECTED(2 downto 0),
      M_AXI_GP0_ARVALID => NLW_processing_system7_0_M_AXI_GP0_ARVALID_UNCONNECTED,
      M_AXI_GP0_AWADDR(31 downto 0) => NLW_processing_system7_0_M_AXI_GP0_AWADDR_UNCONNECTED(31 downto 0),
      M_AXI_GP0_AWBURST(1 downto 0) => NLW_processing_system7_0_M_AXI_GP0_AWBURST_UNCONNECTED(1 downto 0),
      M_AXI_GP0_AWCACHE(3 downto 0) => NLW_processing_system7_0_M_AXI_GP0_AWCACHE_UNCONNECTED(3 downto 0),
      M_AXI_GP0_AWID(11 downto 0) => NLW_processing_system7_0_M_AXI_GP0_AWID_UNCONNECTED(11 downto 0),
      M_AXI_GP0_AWLEN(3 downto 0) => NLW_processing_system7_0_M_AXI_GP0_AWLEN_UNCONNECTED(3 downto 0),
      M_AXI_GP0_AWLOCK(1 downto 0) => NLW_processing_system7_0_M_AXI_GP0_AWLOCK_UNCONNECTED(1 downto 0),
      M_AXI_GP0_AWPROT(2 downto 0) => NLW_processing_system7_0_M_AXI_GP0_AWPROT_UNCONNECTED(2 downto 0),
      M_AXI_GP0_AWQOS(3 downto 0) => NLW_processing_system7_0_M_AXI_GP0_AWQOS_UNCONNECTED(3 downto 0),
      M_AXI_GP0_AWREADY => GND_1,
      M_AXI_GP0_AWSIZE(2 downto 0) => NLW_processing_system7_0_M_AXI_GP0_AWSIZE_UNCONNECTED(2 downto 0),
      M_AXI_GP0_AWVALID => NLW_processing_system7_0_M_AXI_GP0_AWVALID_UNCONNECTED,
      M_AXI_GP0_BID(11) => GND_1,
      M_AXI_GP0_BID(10) => GND_1,
      M_AXI_GP0_BID(9) => GND_1,
      M_AXI_GP0_BID(8) => GND_1,
      M_AXI_GP0_BID(7) => GND_1,
      M_AXI_GP0_BID(6) => GND_1,
      M_AXI_GP0_BID(5) => GND_1,
      M_AXI_GP0_BID(4) => GND_1,
      M_AXI_GP0_BID(3) => GND_1,
      M_AXI_GP0_BID(2) => GND_1,
      M_AXI_GP0_BID(1) => GND_1,
      M_AXI_GP0_BID(0) => GND_1,
      M_AXI_GP0_BREADY => NLW_processing_system7_0_M_AXI_GP0_BREADY_UNCONNECTED,
      M_AXI_GP0_BRESP(1) => GND_1,
      M_AXI_GP0_BRESP(0) => GND_1,
      M_AXI_GP0_BVALID => GND_1,
      M_AXI_GP0_RDATA(31) => GND_1,
      M_AXI_GP0_RDATA(30) => GND_1,
      M_AXI_GP0_RDATA(29) => GND_1,
      M_AXI_GP0_RDATA(28) => GND_1,
      M_AXI_GP0_RDATA(27) => GND_1,
      M_AXI_GP0_RDATA(26) => GND_1,
      M_AXI_GP0_RDATA(25) => GND_1,
      M_AXI_GP0_RDATA(24) => GND_1,
      M_AXI_GP0_RDATA(23) => GND_1,
      M_AXI_GP0_RDATA(22) => GND_1,
      M_AXI_GP0_RDATA(21) => GND_1,
      M_AXI_GP0_RDATA(20) => GND_1,
      M_AXI_GP0_RDATA(19) => GND_1,
      M_AXI_GP0_RDATA(18) => GND_1,
      M_AXI_GP0_RDATA(17) => GND_1,
      M_AXI_GP0_RDATA(16) => GND_1,
      M_AXI_GP0_RDATA(15) => GND_1,
      M_AXI_GP0_RDATA(14) => GND_1,
      M_AXI_GP0_RDATA(13) => GND_1,
      M_AXI_GP0_RDATA(12) => GND_1,
      M_AXI_GP0_RDATA(11) => GND_1,
      M_AXI_GP0_RDATA(10) => GND_1,
      M_AXI_GP0_RDATA(9) => GND_1,
      M_AXI_GP0_RDATA(8) => GND_1,
      M_AXI_GP0_RDATA(7) => GND_1,
      M_AXI_GP0_RDATA(6) => GND_1,
      M_AXI_GP0_RDATA(5) => GND_1,
      M_AXI_GP0_RDATA(4) => GND_1,
      M_AXI_GP0_RDATA(3) => GND_1,
      M_AXI_GP0_RDATA(2) => GND_1,
      M_AXI_GP0_RDATA(1) => GND_1,
      M_AXI_GP0_RDATA(0) => GND_1,
      M_AXI_GP0_RID(11) => GND_1,
      M_AXI_GP0_RID(10) => GND_1,
      M_AXI_GP0_RID(9) => GND_1,
      M_AXI_GP0_RID(8) => GND_1,
      M_AXI_GP0_RID(7) => GND_1,
      M_AXI_GP0_RID(6) => GND_1,
      M_AXI_GP0_RID(5) => GND_1,
      M_AXI_GP0_RID(4) => GND_1,
      M_AXI_GP0_RID(3) => GND_1,
      M_AXI_GP0_RID(2) => GND_1,
      M_AXI_GP0_RID(1) => GND_1,
      M_AXI_GP0_RID(0) => GND_1,
      M_AXI_GP0_RLAST => GND_1,
      M_AXI_GP0_RREADY => NLW_processing_system7_0_M_AXI_GP0_RREADY_UNCONNECTED,
      M_AXI_GP0_RRESP(1) => GND_1,
      M_AXI_GP0_RRESP(0) => GND_1,
      M_AXI_GP0_RVALID => GND_1,
      M_AXI_GP0_WDATA(31 downto 0) => NLW_processing_system7_0_M_AXI_GP0_WDATA_UNCONNECTED(31 downto 0),
      M_AXI_GP0_WID(11 downto 0) => NLW_processing_system7_0_M_AXI_GP0_WID_UNCONNECTED(11 downto 0),
      M_AXI_GP0_WLAST => NLW_processing_system7_0_M_AXI_GP0_WLAST_UNCONNECTED,
      M_AXI_GP0_WREADY => GND_1,
      M_AXI_GP0_WSTRB(3 downto 0) => NLW_processing_system7_0_M_AXI_GP0_WSTRB_UNCONNECTED(3 downto 0),
      M_AXI_GP0_WVALID => NLW_processing_system7_0_M_AXI_GP0_WVALID_UNCONNECTED,
      PS_CLK => FIXED_IO_ps_clk,
      PS_PORB => FIXED_IO_ps_porb,
      PS_SRSTB => FIXED_IO_ps_srstb,
      TTC0_WAVE0_OUT => NLW_processing_system7_0_TTC0_WAVE0_OUT_UNCONNECTED,
      TTC0_WAVE1_OUT => NLW_processing_system7_0_TTC0_WAVE1_OUT_UNCONNECTED,
      TTC0_WAVE2_OUT => NLW_processing_system7_0_TTC0_WAVE2_OUT_UNCONNECTED,
      USB0_PORT_INDCTL(1 downto 0) => NLW_processing_system7_0_USB0_PORT_INDCTL_UNCONNECTED(1 downto 0),
      USB0_VBUS_PWRFAULT => GND_1,
      USB0_VBUS_PWRSELECT => NLW_processing_system7_0_USB0_VBUS_PWRSELECT_UNCONNECTED
    );
v_axi4s_vid_out_0: component zynq_design_v_axi4s_vid_out_0_0
    port map (
      aclk => processing_system7_0_FCLK_CLK0,
      aclken => xlconstant_0_dout(0),
      aresetn => processing_system7_0_FCLK_RESET0_N,
      empty => NLW_v_axi4s_vid_out_0_empty_UNCONNECTED,
      fid => GND_1,
      locked => NLW_v_axi4s_vid_out_0_locked_UNCONNECTED,
      rst => GND_1,
      s_axis_video_tdata(15 downto 0) => v_yuv444to422_0_M_AXIS_TDATA(15 downto 0),
      s_axis_video_tlast => v_yuv444to422_0_M_AXIS_TLAST,
      s_axis_video_tready => v_yuv444to422_0_M_AXIS_TREADY,
      s_axis_video_tuser => v_yuv444to422_0_M_AXIS_TUSER,
      s_axis_video_tvalid => v_yuv444to422_0_M_AXIS_TVALID,
      vid_active_video => v_axi4s_vid_out_0_vid_active_video,
      vid_data(15 downto 0) => v_axi4s_vid_out_0_vid_data(15 downto 0),
      vid_field_id => NLW_v_axi4s_vid_out_0_vid_field_id_UNCONNECTED,
      vid_hblank => NLW_v_axi4s_vid_out_0_vid_hblank_UNCONNECTED,
      vid_hsync => v_axi4s_vid_out_0_vid_hsync,
      vid_io_out_ce => xlconstant_0_dout(0),
      vid_io_out_clk => processing_system7_0_FCLK_CLK0,
      vid_vblank => NLW_v_axi4s_vid_out_0_vid_vblank_UNCONNECTED,
      vid_vsync => v_axi4s_vid_out_0_vid_vsync,
      vtg_active_video => v_tc_0_vtiming_out_ACTIVE_VIDEO,
      vtg_ce => v_axi4s_vid_out_0_vtg_ce,
      vtg_field_id => GND_1,
      vtg_hblank => v_tc_0_vtiming_out_HBLANK,
      vtg_hsync => v_tc_0_vtiming_out_HSYNC,
      vtg_vblank => v_tc_0_vtiming_out_VBLANK,
      vtg_vsync => v_tc_0_vtiming_out_VSYNC,
      wr_error => NLW_v_axi4s_vid_out_0_wr_error_UNCONNECTED
    );
v_rgb2ycrcb_0: component zynq_design_v_rgb2ycrcb_0_0
    port map (
      aclk => processing_system7_0_FCLK_CLK0,
      aclken => xlconstant_0_dout(0),
      aresetn => processing_system7_0_FCLK_RESET0_N,
      m_axis_video_tdata(23 downto 0) => v_rgb2ycrcb_0_video_out_TDATA(23 downto 0),
      m_axis_video_tlast => v_rgb2ycrcb_0_video_out_TLAST,
      m_axis_video_tready => v_rgb2ycrcb_0_video_out_TREADY,
      m_axis_video_tuser_sof => v_rgb2ycrcb_0_video_out_TUSER,
      m_axis_video_tvalid => v_rgb2ycrcb_0_video_out_TVALID,
      s_axis_video_tdata(23 downto 0) => bitcrop_1_M_AXI_TDATA(23 downto 0),
      s_axis_video_tlast => bitcrop_1_M_AXI_TLAST,
      s_axis_video_tready => bitcrop_1_M_AXI_TREADY,
      s_axis_video_tuser_sof => bitcrop_1_M_AXI_TUSER,
      s_axis_video_tvalid => bitcrop_1_M_AXI_TVALID
    );
v_tc_0: component zynq_design_v_tc_0_0
    port map (
      active_video_out => v_tc_0_vtiming_out_ACTIVE_VIDEO,
      clk => processing_system7_0_FCLK_CLK0,
      clken => xlconstant_0_dout(0),
      fsync_out(0) => NLW_v_tc_0_fsync_out_UNCONNECTED(0),
      gen_clken => v_axi4s_vid_out_0_vtg_ce,
      hblank_out => v_tc_0_vtiming_out_HBLANK,
      hsync_out => v_tc_0_vtiming_out_HSYNC,
      resetn => processing_system7_0_FCLK_RESET0_N,
      vblank_out => v_tc_0_vtiming_out_VBLANK,
      vsync_out => v_tc_0_vtiming_out_VSYNC
    );
v_tpg_0: component zynq_design_v_tpg_0_0
    port map (
      aclk => processing_system7_0_FCLK_CLK0,
      aclken => xlconstant_0_dout(0),
      aresetn => processing_system7_0_FCLK_RESET0_N,
      m_axis_video_tdata(23 downto 0) => v_tpg_0_video_out_TDATA(23 downto 0),
      m_axis_video_tlast => v_tpg_0_video_out_TLAST,
      m_axis_video_tready => v_tpg_0_video_out_TREADY,
      m_axis_video_tuser => v_tpg_0_video_out_TUSER,
      m_axis_video_tvalid => v_tpg_0_video_out_TVALID
    );
v_yuv444to422_0: component zynq_design_v_yuv444to422_0_0
    port map (
      aclk => processing_system7_0_FCLK_CLK0,
      aresetn => processing_system7_0_FCLK_RESET0_N,
      m_axis_tdata(15 downto 0) => v_yuv444to422_0_M_AXIS_TDATA(15 downto 0),
      m_axis_tlast => v_yuv444to422_0_M_AXIS_TLAST,
      m_axis_tready => v_yuv444to422_0_M_AXIS_TREADY,
      m_axis_tuser => v_yuv444to422_0_M_AXIS_TUSER,
      m_axis_tvalid => v_yuv444to422_0_M_AXIS_TVALID,
      s_axi_tdata(23 downto 0) => v_rgb2ycrcb_0_video_out_TDATA(23 downto 0),
      s_axi_tlast => v_rgb2ycrcb_0_video_out_TLAST,
      s_axi_tready => v_rgb2ycrcb_0_video_out_TREADY,
      s_axi_tuser => v_rgb2ycrcb_0_video_out_TUSER,
      s_axi_tvalid => v_rgb2ycrcb_0_video_out_TVALID
    );
xlconstant_0: component zynq_design_xlconstant_0_0
    port map (
      dout(0) => xlconstant_0_dout(0)
    );
end STRUCTURE;
