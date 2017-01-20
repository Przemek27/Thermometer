--Projekt: Termometr
--Plik: bcd2seg
--Autor: Przemyslaw Sala
--Funkcjonalnosc: Dekoder pojedynczej cyfry w kodzie bcd na wyswietlacz 7-segmentowy

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity bcd2seg is
	port(
		bcd_in: in std_logic_vector(3 downto 0);
		segment: out std_logic_vector(6 downto 0)
	);
end bcd2seg;

architecture behavioral of bcd2seg is

begin
	process(bcd_in)
	begin
		case bcd_in is
			when X"0"   => segment <= "0111111"; -- 0
			when X"1"   => segment <= "0000110"; -- 1
			when X"2"   => segment <= "1011011"; -- 2
			when X"3"   => segment <= "1001111"; -- 3
			when X"4"   => segment <= "1100110"; -- 4
			when X"5"   => segment <= "1101101"; -- 5
			when X"6"   => segment <= "1111101"; -- 6
			when X"7"   => segment <= "0000111"; -- 7
			when X"8"   => segment <= "1111111"; -- 8
			when X"9"   => segment <= "1101111"; -- 9
			when X"F"   => segment <= "1000000"; -- '-'			-- wartosc hex 'F' jest dekodowana jako znak '-'
																				-- w taki sposob zostala zakodowana wartosc ujemna w pliku LUT.mif
			when others => segment <= "0000000"; -- error
		end case;
	end process;
end behavioral;