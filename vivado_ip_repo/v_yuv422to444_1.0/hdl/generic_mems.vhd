library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--! Generic synchronous two-port memory, read-first (default) or write-first behaviour.
--! Port A is Read/Write, Port B is read-only.
--! In the default mode, both read ports are read-first and synchronous: they return data according
--! to the address given on the last rising_edge(clk) and prior to a possible
--! write on Port A.
--! Each port can be individually switched into the write-first mode. In this mode the data
--! read from the memory reflect the state after a possible write on Port A.
--! However, this requires an additional resources: a multiplexer in the case of Port A,
--! and a multiplexer and comparator in the case of Port B.

entity generic_syncmem_rw_r is
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
end entity generic_syncmem_rw_r;


architecture rtl of generic_syncmem_rw_r is

type t_data is array(0 to 2 ** A_WIDTH - 1) of std_logic_vector(D_WIDTH - 1 downto 0);

-- synthesis translate_off
constant INVALID_MEMDATA : t_data := (others => (others => 'U')); 
-- synthesis translate_on

-- NOTE: Matching sim behaviour to real hw: in FPGA the initial value is 0
signal data : t_data := (others => (others => '0')); 

begin
    mem : process(clk) is
    begin
        if rising_edge(clk) then
            -- Port A - sample address and read the data (read-first)
            if not is_x(addr_a) then
                dout_a <= data(to_integer(unsigned(addr_a)));
            else
                -- synthesis translate_off
                dout_a <= (others => 'U');
                -- synthesis translate_on
            end if;
            
            -- Port B - sample address and read the data (read-first)
            if not is_x(addr_b) then
                dout_b <= data(to_integer(unsigned(addr_b)));
            else
                -- synthesis translate_off
                dout_b <= (others => 'U');
                -- synthesis translate_on
            end if;
            
            -- Port A - Write
            if (we_a = '1') then
                -- write new data into the memory ...
                if not is_x(addr_a) then
                    data(to_integer(unsigned(addr_a))) <= din_a;
                else
                    -- synthesis translate_off
                    -- a write to an X address invalidates the whole memory
                    data <= INVALID_MEMDATA;
                    -- synthesis translate_on
                end if;
                
                -- Write-first on port A requires an additional multiplexer
                if WRFST_AA /= 0 then
                    -- also store into Port A data output (infers multiplexer)
                    dout_a <= din_a;
                end if;
                
                -- Write-first on port B requires a multiplexer and comparator
                if WRFST_AB /= 0 then
                    -- Port B is reading from the address that the Port A is writing?
                    if (addr_b = addr_a) then
                        dout_b <= din_a;
                    end if;
                    
                    -- synthesis translate_off
                    -- Handle X
                    if is_x(addr_b) or is_x(addr_a) then
                        dout_b <= (others => 'U');
                    end if;
                    -- synthesis translate_on
                end if;
            end if;
        end if;
    end process mem;

end architecture rtl;


---------------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--! Generic two-port asynchronous memory.
--! Reads on both ports are completely asynchronous.
--! Write on port A is synchronous to clk.

entity generic_asyncmem_rw_r is
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
end entity generic_asyncmem_rw_r;

--##############################################################################

architecture rtl of generic_asyncmem_rw_r is

type t_data is array (0 to 2 ** A_WIDTH - 1) of std_logic_vector(D_WIDTH - 1 downto 0);

-- synthesis translate_off
constant INVALID_MEMDATA : t_data := (others => (others => 'U')); 
-- synthesis translate_on

-- NOTE: Matching sim behaviour to real hw: in FPGA the initial value is 0
signal data : t_data := (others => (others => '0')); 

begin

    p_write : process(clk) is
    begin
        if (clk = '1' and clk'event) then
            if (we_a = '1') then
                if not is_x(addr_a) then
                    data(to_integer(unsigned(addr_a))) <= din_a;
                else
                    -- synthesis translate_off
                    -- a write to X address invalidates the whole memory
                    data <= INVALID_MEMDATA;
                    -- synthesis translate_on
                end if;
            end if;
        end if;    
    end process p_write;

-- Asynchronous read
    p_read: process (data, addr_a, addr_b)
    begin
        if not is_x(addr_a) then
            dout_a <= data(to_integer(unsigned(addr_a))); 
        else
            -- synthesis translate_off
            dout_a <= (others => 'U');
            -- synthesis translate_on
        end if;
        
        if not is_x(addr_b) then
            dout_b <= data(to_integer(unsigned(addr_b)));
        else
            -- synthesis translate_off
            dout_b <= (others => 'U');
            -- synthesis translate_on
        end if;
    end process;

end architecture rtl;  
