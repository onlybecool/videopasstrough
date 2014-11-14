----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2013 10:02:40 AM
-- Design Name: 
-- Module Name: axis_fifo - rtl
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity axis_fifo is
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
end axis_fifo;

architecture rtl of axis_fifo is

component generic_fifo is
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
    din   : in  std_logic_vector(D_WIDTH-1 downto 0);   --! data to fifo
    wr    : in  std_logic;                              --! write strobe signal
    clear : in  std_logic;                              --! clear (reset) the fifo
    -- FIFO output
    dout  : out std_logic_vector(D_WIDTH-1 downto 0);   --! data from fifo
    rd    : in  std_logic;                              --! read strobe signal
    -- FIFO state
    empty : out std_logic;                              --! fifo empty flag
    full  : out std_logic;                              --!  fifo full flag
    count : out std_logic_vector(CNT_WIDTH-1 downto 0) --! current number of words in the fifo
);
end component;


signal din, dout : std_logic_vector(D_WIDTH+2-1 downto 0);

begin

    fifo: generic_fifo
    generic map (
        LENGTH => LENGTH,
        D_WIDTH => D_WIDTH + 2,
        CNT_WIDTH => CNT_WIDTH,
        ASYNCM => ASYNCM
    )
    port map (
        rstn, clk,
        din, wr, clear,
        dout, rd,
        empty, full, count
    );

    din <= din_tuser & din_tlast & din_tdata;
    dout_tuser <= dout(D_WIDTH+2-1);
    dout_tlast <= dout(D_WIDTH+2-2);
    dout_tdata <= dout(D_WIDTH-1 downto 0);
    
end rtl;
