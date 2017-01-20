--Projekt: Termometr
--Plik: mux
--Autor: Przemyslaw Sala
--Funkcjonalnosc: Multiplekser wybiera z kodu bcd pojedyncza cyfre do wyswietlenia

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mux is

port(
	bcd_in: in std_logic_vector(15 downto 0);
	sel: in std_logic_vector(1 downto 0);
	bcd_out: out std_logic_vector(3 downto 0)
	);
end mux;

	architecture behavioral of mux is
	begin 
	
	process(sel)
	  begin
	  case sel is
	      when "00" => bcd_out <= bcd_in(3 downto 0);
			when "01" => bcd_out <= bcd_in(7 downto 4);
			when "10" => bcd_out <= bcd_in(11 downto 8);
			when "11" => bcd_out <= bcd_in(15 downto 12);
			when others => bcd_out <= "0000";
		end case;
	
	end process;
end behavioral;
