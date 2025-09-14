library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sign_extender is
	port (
		sign_extender_in    : in std_logic_vector (15 downto 0); -- 16-bit input
		sign_extender_func  : in std_logic_vector (1 downto 0);  -- Function select
		sign_extender_out   : out std_logic_vector (31 downto 0) -- 32-bit output
	);
end sign_extender;

architecture arch of sign_extender is
begin
    process(sign_extender_in, sign_extender_func)
    begin
        case sign_extender_func is
            -- Load Upper Immediate (Pad LSBs with 0s)
            when "00" =>  
                sign_extender_out <= sign_extender_in & X"0000";

            -- Sign Extend (Pad MSBs with sign bit)
            when "01" | "10" =>  
                sign_extender_out(15 downto 0)  <= sign_extender_in;
                sign_extender_out(31 downto 16) <= (others => sign_extender_in(15));

            -- Logical Extension (Pad MSBs with 0s)
            when "11" =>
                sign_extender_out <= X"0000" & sign_extender_in;

            -- Default (Should Never Happen)
            when others => 
                sign_extender_out <= (others => '0');  
        end case;
    end process;
end arch;

