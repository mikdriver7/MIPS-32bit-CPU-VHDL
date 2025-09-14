library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity alu is
port(
-- two input operands
x, y : in std_logic_vector(31 downto 0);

-- 0 = add , 1 = sub
add_sub : in std_logic ; 

-- 00 = AND, 01 = OR , 10 = XOR , 11 = NOR
logic_func : in std_logic_vector(1 downto 0 ) ;

-- 00 = lui, 01 = setless , 10 = arith , 11 = logic
func : in std_logic_vector(1 downto 0 ) ;

-- output
output : out std_logic_vector(31 downto 0) ;
overflow : out std_logic ;
zero : out std_logic);
end alu ;

architecture arch of alu is
	signal add_sub_output, logic_output : std_logic_vector(31 downto 0);
begin
	-- addition or subtraction
	process(x, y, add_sub)
	begin
		if (add_sub = '0') then
			 add_sub_output <= std_logic_vector(signed(x) + signed(y));	
		else
			add_sub_output <= std_logic_vector(signed(x) - signed(y));
		end if;
	end process;

  -- logic
	process (x,y, logic_func)
	begin
		if ( logic_func = "00") then logic_output <= x and y;
		elsif (logic_func = "01") then logic_output <= x or y;
		elsif (logic_func = "01") then logic_output <= x xor y;
		else logic_output <= x nor y;
		end if;
	end process;

	-- multiplexer
	process (y, func, add_sub_output, logic_output)
	begin 
		if ( func = "00") then output <= y;
		elsif (func = "01") then output <= "0000000000000000000000000000000" & add_sub_output(31);
		elsif (func = "10") then output <= add_sub_output;
		else output <= logic_output;
		end if;
  end process;

  -- check zero output
	process(add_sub_output)
	begin
   	 	if (add_sub_output = "0000000000000000000000000000000") then zero <= '1';
		else zero <= '0';
		end if;
	end process;

	-- check overflow
  process(x,y,add_sub, add_sub_output)
	begin
		-- addition
    if (add_sub = '0') then
			if ((x(31) = '0' and y(31) = '0' and add_sub_output(31) = '1') or (x(31) = '1' and y(31) = '1' and add_sub_output(31) = '0')) then
            overflow <= '1';
        else
            overflow <= '0'; 
        end if;

		-- subtraction
		elsif add_sub = '1' then
        			if ((x(31) = '0' and y(31) = '1' and add_sub_output(31) = '1') or (x(31) = '1' and y(31) = '0' and add_sub_output(31) = '0')) then
            overflow <= '1'; 
        else
            overflow <= '0'; 
        end if;
    end if;
  end process;

end arch;
