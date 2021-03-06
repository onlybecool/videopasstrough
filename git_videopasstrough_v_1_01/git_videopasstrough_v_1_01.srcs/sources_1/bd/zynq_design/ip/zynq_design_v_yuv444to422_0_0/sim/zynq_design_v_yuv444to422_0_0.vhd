-- (c) Copyright 1995-2014 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: jsykora.info:user:v_yuv444to422:1.0
-- IP Revision: 2

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY work;
USE work.v_yuv444to422_v1_0;

ENTITY zynq_design_v_yuv444to422_0_0 IS
  PORT (
    aclk : IN STD_LOGIC;
    aresetn : IN STD_LOGIC;
    m_axis_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_tuser : OUT STD_LOGIC;
    m_axis_tlast : OUT STD_LOGIC;
    m_axis_tvalid : OUT STD_LOGIC;
    m_axis_tready : IN STD_LOGIC;
    s_axi_tdata : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
    s_axi_tuser : IN STD_LOGIC;
    s_axi_tlast : IN STD_LOGIC;
    s_axi_tvalid : IN STD_LOGIC;
    s_axi_tready : OUT STD_LOGIC
  );
END zynq_design_v_yuv444to422_0_0;

ARCHITECTURE zynq_design_v_yuv444to422_0_0_arch OF zynq_design_v_yuv444to422_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : string;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF zynq_design_v_yuv444to422_0_0_arch: ARCHITECTURE IS "yes";

  COMPONENT v_yuv444to422_v1_0 IS
    GENERIC (
      C_M_AXIS_TDATA_WIDTH : INTEGER; -- Width of S_AXIS address bus. The slave accepts the read and write addresses of width C_M_AXIS_TDATA_WIDTH.
      C_S_AXI_TDATA_WIDTH : INTEGER -- AXI4Stream sink: Data Width
    );
    PORT (
      aclk : IN STD_LOGIC;
      aresetn : IN STD_LOGIC;
      m_axis_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      m_axis_tuser : OUT STD_LOGIC;
      m_axis_tlast : OUT STD_LOGIC;
      m_axis_tvalid : OUT STD_LOGIC;
      m_axis_tready : IN STD_LOGIC;
      s_axi_tdata : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
      s_axi_tuser : IN STD_LOGIC;
      s_axi_tlast : IN STD_LOGIC;
      s_axi_tvalid : IN STD_LOGIC;
      s_axi_tready : OUT STD_LOGIC
    );
  END COMPONENT v_yuv444to422_v1_0;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 S_AXI_CLK CLK";
  ATTRIBUTE X_INTERFACE_INFO OF aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 S_AXI_RST RST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_tuser: SIGNAL IS "xilinx.com:interface:axis:1.0 M_AXIS TUSER";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_tlast: SIGNAL IS "xilinx.com:interface:axis:1.0 M_AXIS TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 M_AXIS TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 M_AXIS TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 S_AXI TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_tuser: SIGNAL IS "xilinx.com:interface:axis:1.0 S_AXI TUSER";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_tlast: SIGNAL IS "xilinx.com:interface:axis:1.0 S_AXI TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 S_AXI TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 S_AXI TREADY";
BEGIN
  U0 : v_yuv444to422_v1_0
    GENERIC MAP (
      C_M_AXIS_TDATA_WIDTH => 16,
      C_S_AXI_TDATA_WIDTH => 24
    )
    PORT MAP (
      aclk => aclk,
      aresetn => aresetn,
      m_axis_tdata => m_axis_tdata,
      m_axis_tuser => m_axis_tuser,
      m_axis_tlast => m_axis_tlast,
      m_axis_tvalid => m_axis_tvalid,
      m_axis_tready => m_axis_tready,
      s_axi_tdata => s_axi_tdata,
      s_axi_tuser => s_axi_tuser,
      s_axi_tlast => s_axi_tlast,
      s_axi_tvalid => s_axi_tvalid,
      s_axi_tready => s_axi_tready
    );
END zynq_design_v_yuv444to422_0_0_arch;
