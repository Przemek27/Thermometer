--Projekt: Termometr
--Plik: my_adc
--Autor: Przemyslaw Sala
--Funkcjonalnosc: Przetwornik A/C. Analogowa wartosc otrzymana z czujnika temperatury przetwarza na wartosc binarna.
--						Komponent ADC został wygenerowany przy pomocy narzedzia Quartus'a Qsys.

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY my_adc IS

	PORT(
		CLK : IN  std_logic;
		data: out std_logic_vector(11 downto 0)
	);

END my_adc;
	
ARCHITECTURE arch OF my_adc IS

	signal delay : std_logic_vector(1 downto 0);	
	signal reset_reset_n : std_logic;
	signal command_valid : std_logic;
	signal command_channel : std_logic_vector(4 DOWNTO 0);
	signal command_startofpacket : std_logic;
	signal command_endofpacket : std_logic;
	signal command_ready : std_logic;
	signal response_valid : std_logic;
	signal response_channel : std_logic_vector(4 DOWNTO 0);
	signal response_data : std_logic_vector(11 DOWNTO 0);
	signal response_startofpacket : std_logic;
	signal response_endofpacket : std_logic;

	component ADC is		--deklaracja komponentu ADC wygenerowana za pomoca narzedzia Qsys
		port (
			clk_clk                : in  std_logic                     := 'X';             -- clk
			reset_reset_n          : in  std_logic                     := 'X';             -- reset_n
			command_valid          : in  std_logic                     := 'X';             -- valid
			command_channel        : in  std_logic_vector(4 downto 0)  := (others => 'X'); -- channel
			command_startofpacket  : in  std_logic                     := 'X';             -- startofpacket
			command_endofpacket    : in  std_logic                     := 'X';             -- endofpacket
			command_ready          : out std_logic;                                        -- ready
			response_valid         : out std_logic;                                        -- valid
			response_channel       : out std_logic_vector(4 downto 0);                     -- channel
			response_data          : out std_logic_vector(11 downto 0);                    -- data
			response_startofpacket : out std_logic;                                        -- startofpacket
			response_endofpacket   : out std_logic                                         -- endofpacket
		);
	end component;
	
	component counter is
		generic(bits : integer);
		port ( clk : in  std_logic;
				 sel : out  std_logic_vector(1 downto 0)
		);
	end component;
	
	begin
	
	u0 : component ADC
		port map (
			clk_clk                => CLK,                --        clk.clk
			reset_reset_n          => reset_reset_n,          --      reset.reset_n
			command_valid          => command_valid,          --    command.valid
			command_channel        => command_channel,        --           .channel
			command_startofpacket  => command_startofpacket,  --           .startofpacket
			command_endofpacket    => command_endofpacket,    --           .endofpacket
			command_ready          => command_ready,          --           .ready
			response_valid         => response_valid,         --   response.valid
			response_channel       => response_channel,       --           .channel
			response_data          => response_data,          --           .data
			response_startofpacket => response_startofpacket, --           .startofpacket
			response_endofpacket   => response_endofpacket   --           .endofpacket
		);
		
	u1: counter 
		generic map (bits =>20) 
		port map (
				CLK => clk, 
				sel => delay
		);

	command_channel <= "01111";	-- ustawione wejscie sygnalu analogowego: nr kanalu 15 = ADC1_15  
	reset_reset_n <= '1';
	command_valid <= '1';
	command_startofpacket <= '1';
	command_ready <= '1';
	
	process(CLK)
		variable zatrzask : std_logic := '0';
	begin
	
		if rising_edge(CLK) and response_valid = '1' then
			if delay(1) = '1' and zatrzask = '0' then
				data <= response_data;
				zatrzask := '1';
			end if;
			
			if delay(1) = '0' then
				zatrzask := '0';
			end if;	
		end if;	
	end process;
		
end arch;