--Projekt: Termometr
--Plik: demux
--Autor: Przemyslaw Sala
--Funkcjonalnosc: Demultiplekser wybiera cyfre do wyswietlenia, dodatkowo wlacza kropke na wyswietlaczu 7seg, oddzielajaca
--						czesc dziesietna

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity demux is
	port(
		sel: in std_logic_vector(1 downto 0);
		digit: out std_logic_vector(3 downto 0);
		segDP: out std_logic		--segment odpowiadajacy za wyswietlenie kropki
	);
end demux;

architecture behavioral of demux IS
	begin 
	
	process(sel)
	  begin
	  case sel is
	      when "00" => digit <= "0001"; segDP <= '0';
			when "01" => digit <= "0010"; segDP <= '1';		--ostatnia cyfra jest oddzielona kropka od reszty, wyswietla ona wartosc dziesietna
			when "10" => digit <= "0100"; segDP <= '0';
			when "11" => digit <= "1000"; segDP <= '0';
			when others => digit <= "0000"; segDP <= '0';
		end case;
	
	end process;
end behavioral;