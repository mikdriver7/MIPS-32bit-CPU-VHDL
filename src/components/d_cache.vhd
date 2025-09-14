library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity d_cache is
    port( 
        din     : in std_logic_vector(31 downto 0);  -- Data input
        reset   : in std_logic;                      -- Reset signal
        clk     : in std_logic;                      -- Clock signal
        write   : in std_logic;                      -- Write enable
        address : in std_logic_vector(4 downto 0);   -- 5-bit address (32 locations)
        d_out   : out std_logic_vector(31 downto 0)  -- Data output
    );
end d_cache;

architecture arch of d_cache is
    -- Define a memory array of 32 registers, each 32 bits wide
    type t_reg_array is array (0 to 31) of std_logic_vector(31 downto 0);
    signal reg_array : t_reg_array;
begin

    -- Write process
    process(clk, reset)
    begin
        if (reset = '1') then
            -- Reset all registers to zero
            for i in 0 to 31 loop
                reg_array(i) <= (others => '0');
            end loop;
        elsif (clk'event and clk='1') then
            if write = '1' then
                reg_array(conv_integer(address)) <= din;
            end if;
        end if;
    end process; 

    -- Read process
    process(address, reg_array)
    begin
        d_out <= reg_array(conv_integer(address));
    end process;

end arch;

