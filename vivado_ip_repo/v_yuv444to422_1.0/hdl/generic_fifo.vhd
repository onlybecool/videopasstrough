----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2013 10:06:14 AM
-- Design Name: 
-- Module Name: generic_fifo - rtl
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity generic_fifo is
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
end entity generic_fifo;

architecture rtl of generic_fifo is

component generic_syncmem_rw_r is
generic(
    D_WIDTH : positive := 8;
    A_WIDTH : positive := 6;
    WRFST_AA : integer := 0;            -- Port-A-Write to Port-A-Read
    WRFST_AB : integer := 0             -- Port-A-Write to Port-B-Read
);
port (
    clk         : in std_logic;
    -- Port A: R/W
    addr_a      : in std_logic_vector(A_WIDTH - 1 downto 0);
    din_a       : in std_logic_vector(D_WIDTH - 1 downto 0);
    we_a        : in std_logic;
    dout_a      : out std_logic_vector(D_WIDTH - 1 downto 0);
    -- Port B: R
    addr_b      : in std_logic_vector(A_WIDTH - 1 downto 0);
    dout_b      : out std_logic_vector(D_WIDTH - 1 downto 0)
);
end component;

component generic_asyncmem_rw_r is
generic(
    D_WIDTH : positive := 1;
    A_WIDTH : positive := 4
);
port (
    clk         : in std_logic;
    -- PORT A
    addr_a      : in std_logic_vector(A_WIDTH - 1 downto 0);
    din_a       : in std_logic_vector(D_WIDTH - 1 downto 0);
    we_a        : in std_logic;
    dout_a      : out std_logic_vector(D_WIDTH - 1 downto 0);
    -- PORT B
    addr_b      : in std_logic_vector(A_WIDTH - 1 downto 0);
    dout_b      : out std_logic_vector(D_WIDTH - 1 downto 0)
);
end component;

function log2(N: integer) return natural is
begin
    if N < 2 then
        return 1;
    else
        return 1 + log2(N/2);
    end if;
end function log2;


constant ZERO : std_logic_vector(D_WIDTH - 1 downto 0) := (others => '0');

-- data for LENGTH == 1
signal fifo_reg  : std_logic_vector(D_WIDTH - 1 downto 0) := (others => '0');

signal s_wr_ptr_next  : std_logic_vector ( (log2(LENGTH - 1) - 1) downto 0);
signal s_rd_ptr_next  : std_logic_vector ( (log2(LENGTH - 1) - 1) downto 0);

-- registers:
signal s_wr_ptr  : std_logic_vector ( (log2(LENGTH - 1) - 1) downto 0);
signal s_rd_ptr  : std_logic_vector ( (log2(LENGTH - 1) - 1) downto 0);

-- registers:
signal s_full : std_logic;
signal s_empty : std_logic;
signal s_count  : std_logic_vector (CNT_WIDTH-1 downto 0);

signal mem_write : std_logic;  

signal s_dout  : std_logic_vector(D_WIDTH-1 downto 0);   --! temp internal data from fifo


begin
-- outputs
    dout <= s_dout
        -- synthesis translate_off
            when s_empty = '0' else (others => 'U')
        -- synthesis translate_on
        ;
    full <= s_full;
    empty <= s_empty;
    count <= s_count;
    
-- FIFO size = 1
    fifo_size_1: if (LENGTH = 1) generate
        process (clk)
        begin
            -- read from/write to FIFO
            if rising_edge(clk) then
                if (rstn /= '1') or (clear = '1') then
                    s_full <= '0';  
                    s_empty <= '1';
                    s_count <= (others => '0');
                else
                    s_count(CNT_WIDTH-1 downto 1) <= (others => '0');
                    
                    -- synthesis translate_off
                    assert not (wr = '1' and s_full = '1')
                        report "Can't write to full FIFO! (LENGTH=" & integer'image(LENGTH) & ")"
                        severity failure;
                    -- synthesis translate_on
                    
                    -- write to FIFO
                    if (wr = '1' and s_full = '0') then      
                        fifo_reg <= din;
                        s_empty <= '0';
                        s_full <= '1';
                        s_count(0) <= '1';
                    end if;
                    
                    -- synthesis translate_off
                    assert not(rd = '1' and s_empty = '1')
                        report "Can't read from empty FIFO! (LENGTH=" & integer'image(LENGTH) & ")"
                        severity failure;
                    -- synthesis translate_on
                    
                    -- read from FIFO
                    if (rd = '1' and s_empty = '0') then
                        s_full <= '0';
                        s_count(0) <= '0';
                        s_empty <= '1';
                    end if;
                end if;  
            end if;
        end process;
        
        s_dout <= fifo_reg; 
    end generate fifo_size_1;
    
-- FIFO size > 1
    fifo_size_more: if (LENGTH > 1) generate
        
        p_wr_ptr_next : process(wr, s_full, s_wr_ptr) is
        begin
            if ((wr and not s_full) = '1') then
                if (s_wr_ptr = (LENGTH - 1)) then
                    s_wr_ptr_next <= (others => '0');
                else
                    s_wr_ptr_next <= s_wr_ptr + 1;
                end if;
            else
                s_wr_ptr_next <= s_wr_ptr;
            end if;  
        end process p_wr_ptr_next;

        p_rd_ptr_next : process(rd, s_empty, s_rd_ptr) is
        begin
            if ((rd and not s_empty) = '1') then
                if (s_rd_ptr = (LENGTH - 1)) then
                    s_rd_ptr_next <= (others => '0');
                else
                    s_rd_ptr_next <= s_rd_ptr + 1;
                end if;
            else
                s_rd_ptr_next <= s_rd_ptr;
            end if;  
        end process p_rd_ptr_next;
        
        p_ptr_ff : process(clk) is
        begin
            if rising_edge(clk) then
                if (rstn /= '1') or (clear = '1') then
                    s_wr_ptr <= (others => '0');
                    s_rd_ptr <= (others => '0');
                else  
                    s_wr_ptr <= s_wr_ptr_next;
                    s_rd_ptr <= s_rd_ptr_next;
                end if;
            end if;
        end process p_ptr_ff;  
    
        flags : process (clk)
        variable vinc, vdec: std_ulogic;
        begin
            -- init
            vinc := '0'; vdec := '0';
            
            if rising_edge(clk) then
                if (rstn /= '1') or (clear = '1') then
                    s_full <= '0';  
                    s_empty <= '1';
                    s_count <= (others => '0');
                else
                    -- synthesis translate_off
                    assert not (wr = '1' and s_full = '1')
                        report "Can't write to full FIFO! (LENGTH=" & integer'image(LENGTH) & ")"
                        severity failure;
                    -- synthesis translate_on  
                    
                    -- write to FIFO
                    if (wr and not s_full) = '1' then
                        s_empty <= '0';
                        vinc := '1';
                        if(conv_integer(unsigned(s_wr_ptr_next)) = conv_integer(unsigned(s_rd_ptr_next))) then
                            s_full <= '1';
                        end if;
                    end if;
                    
                    -- synthesis translate_off
                    assert not(rd = '1' and s_empty = '1')
                        report "Can't read from empty FIFO! (LENGTH=" & integer'image(LENGTH) & ")"
                        severity failure;
                    -- synthesis translate_on  
                    
                    -- read from FIFO
                    if (rd and not s_empty) = '1' then
                        s_full <= '0';
                        vdec := '1';
                        if(conv_integer(unsigned(s_wr_ptr_next)) = conv_integer(unsigned(s_rd_ptr_next))) then
                            s_empty <= '1';
                        end if;  
                    end if;
                    
                    if (vinc and not(vdec)) = '1' then
                        s_count <= s_count + 1;
                    elsif (not(vinc) and vdec) = '1' then
                        s_count <= s_count - 1;
                    end if;
                end if;
            end if;  
        end process;

        mem_write <= wr and not s_full;

        sync: if not ASYNCM generate
            -- Synchronous memory.
            -- This is suitable for large and/or wide FIFOs that should use BlockRAMs.
            i_mem : generic_syncmem_rw_r
            generic map (
                A_WIDTH     => log2(LENGTH - 1),
                D_WIDTH     => D_WIDTH,
                WRFST_AB     => 1            -- writes on port A should be immediately visible on port B
            )
            port map (
                clk      => clk,
                -- Port A: R/W
                addr_a      => s_wr_ptr,
                din_a       => din,
                we_a        => mem_write,
                dout_a      => open,
                -- Port B: R
                addr_b      => s_rd_ptr_next,
                dout_b      => s_dout
            );
        end generate;
        
        asym: if ASYNCM generate
            -- Asynchronous memory using distributed RAMs.
            -- Suitable for for common (small) FIFOs.
            i_mem : generic_asyncmem_rw_r
            generic map (
                A_WIDTH     => log2(LENGTH - 1),
                D_WIDTH     => D_WIDTH
            )
            port map (
                clk      => clk,
                -- Port A: R/W
                addr_a      => s_wr_ptr,
                din_a       => din,
                we_a        => mem_write,
                dout_a      => open,
                -- Port B: R
                addr_b      => s_rd_ptr,
                dout_b      => s_dout
            );
        end generate;

        -- drive the unused signal to please synthesis:
        fifo_reg <= (others => '0');
        
    end generate fifo_size_more;

-- check that LENGTH can fit into the count port
    assert LENGTH < 2**CNT_WIDTH
    report "fifo_c: requested width of the count signal is too narrow to fit fifo length!"
    severity error;

end architecture rtl;
