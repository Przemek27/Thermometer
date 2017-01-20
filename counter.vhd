--Projekt: Termometr
--Plik: counter
--Autor: Przemyslaw Sala
--Funkcjonalnosc: Licznik opoznia multipleksowanie oraz sluzy do wybierania liczb do wyswietlenia. Ilosc bitow licznika
-- 					mozna modyfikowac poprzez zmienianie wartosci parametru bits

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is
	 generic(bits : integer := 15);
	 port(
		 CLK : in std_logic;
		 sel : out std_logic_vector(1 downto 0)
	     );
end counter;


architecture behavioral of counter is
begin
	process(CLK)
		variable temp: std_logic_vector(bits downto 0);
		begin
		if CLK'event and CLK='1' then
			temp := temp + 1;
		end if;
		sel <= temp(bits downto bits-1);
	end process;
end behavioral;