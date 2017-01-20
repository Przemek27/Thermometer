-- ADC.vhd

-- Generated using ACDS version 15.1 185

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ADC is
	port (
		clk_clk                : in  std_logic                     := '0';             --      clk.clk
		command_valid          : in  std_logic                     := '0';             --  command.valid
		command_channel        : in  std_logic_vector(4 downto 0)  := (others => '0'); --         .channel
		command_startofpacket  : in  std_logic                     := '0';             --         .startofpacket
		command_endofpacket    : in  std_logic                     := '0';             --         .endofpacket
		command_ready          : out std_logic;                                        --         .ready
		reset_reset_n          : in  std_logic                     := '0';             --    reset.reset_n
		response_valid         : out std_logic;                                        -- response.valid
		response_channel       : out std_logic_vector(4 downto 0);                     --         .channel
		response_data          : out std_logic_vector(11 downto 0);                    --         .data
		response_startofpacket : out std_logic;                                        --         .startofpacket
		response_endofpacket   : out std_logic                                         --         .endofpacket
	);
end entity ADC;

architecture rtl of ADC is
	component ADC_altpll_0 is
		port (
			clk       : in  std_logic                     := 'X';             -- clk
			reset     : in  std_logic                     := 'X';             -- reset
			read      : in  std_logic                     := 'X';             -- read
			write     : in  std_logic                     := 'X';             -- write
			address   : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			readdata  : out std_logic_vector(31 downto 0);                    -- readdata
			writedata : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			c0        : out std_logic;                                        -- clk
			areset    : in  std_logic                     := 'X';             -- export
			locked    : out std_logic;                                        -- export
			phasedone : out std_logic                                         -- export
		);
	end component ADC_altpll_0;

	component ADC_modular_adc_0 is
		port (
			clock_clk              : in  std_logic                     := 'X';             -- clk
			reset_sink_reset_n     : in  std_logic                     := 'X';             -- reset_n
			adc_pll_clock_clk      : in  std_logic                     := 'X';             -- clk
			adc_pll_locked_export  : in  std_logic                     := 'X';             -- export
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
	end component ADC_modular_adc_0;

	component altera_reset_controller is
		generic (
			NUM_RESET_INPUTS          : integer := 6;
			OUTPUT_RESET_SYNC_EDGES   : string  := "deassert";
			SYNC_DEPTH                : integer := 2;
			RESET_REQUEST_PRESENT     : integer := 0;
			RESET_REQ_WAIT_TIME       : integer := 1;
			MIN_RST_ASSERTION_TIME    : integer := 3;
			RESET_REQ_EARLY_DSRT_TIME : integer := 1;
			USE_RESET_REQUEST_IN0     : integer := 0;
			USE_RESET_REQUEST_IN1     : integer := 0;
			USE_RESET_REQUEST_IN2     : integer := 0;
			USE_RESET_REQUEST_IN3     : integer := 0;
			USE_RESET_REQUEST_IN4     : integer := 0;
			USE_RESET_REQUEST_IN5     : integer := 0;
			USE_RESET_REQUEST_IN6     : integer := 0;
			USE_RESET_REQUEST_IN7     : integer := 0;
			USE_RESET_REQUEST_IN8     : integer := 0;
			USE_RESET_REQUEST_IN9     : integer := 0;
			USE_RESET_REQUEST_IN10    : integer := 0;
			USE_RESET_REQUEST_IN11    : integer := 0;
			USE_RESET_REQUEST_IN12    : integer := 0;
			USE_RESET_REQUEST_IN13    : integer := 0;
			USE_RESET_REQUEST_IN14    : integer := 0;
			USE_RESET_REQUEST_IN15    : integer := 0;
			ADAPT_RESET_REQUEST       : integer := 0
		);
		port (
			reset_in0      : in  std_logic := 'X'; -- reset
			clk            : in  std_logic := 'X'; -- clk
			reset_out      : out std_logic;        -- reset
			reset_req      : out std_logic;        -- reset_req
			reset_req_in0  : in  std_logic := 'X'; -- reset_req
			reset_in1      : in  std_logic := 'X'; -- reset
			reset_req_in1  : in  std_logic := 'X'; -- reset_req
			reset_in2      : in  std_logic := 'X'; -- reset
			reset_req_in2  : in  std_logic := 'X'; -- reset_req
			reset_in3      : in  std_logic := 'X'; -- reset
			reset_req_in3  : in  std_logic := 'X'; -- reset_req
			reset_in4      : in  std_logic := 'X'; -- reset
			reset_req_in4  : in  std_logic := 'X'; -- reset_req
			reset_in5      : in  std_logic := 'X'; -- reset
			reset_req_in5  : in  std_logic := 'X'; -- reset_req
			reset_in6      : in  std_logic := 'X'; -- reset
			reset_req_in6  : in  std_logic := 'X'; -- reset_req
			reset_in7      : in  std_logic := 'X'; -- reset
			reset_req_in7  : in  std_logic := 'X'; -- reset_req
			reset_in8      : in  std_logic := 'X'; -- reset
			reset_req_in8  : in  std_logic := 'X'; -- reset_req
			reset_in9      : in  std_logic := 'X'; -- reset
			reset_req_in9  : in  std_logic := 'X'; -- reset_req
			reset_in10     : in  std_logic := 'X'; -- reset
			reset_req_in10 : in  std_logic := 'X'; -- reset_req
			reset_in11     : in  std_logic := 'X'; -- reset
			reset_req_in11 : in  std_logic := 'X'; -- reset_req
			reset_in12     : in  std_logic := 'X'; -- reset
			reset_req_in12 : in  std_logic := 'X'; -- reset_req
			reset_in13     : in  std_logic := 'X'; -- reset
			reset_req_in13 : in  std_logic := 'X'; -- reset_req
			reset_in14     : in  std_logic := 'X'; -- reset
			reset_req_in14 : in  std_logic := 'X'; -- reset_req
			reset_in15     : in  std_logic := 'X'; -- reset
			reset_req_in15 : in  std_logic := 'X'  -- reset_req
		);
	end component altera_reset_controller;

	signal altpll_0_c0_clk                          : std_logic; -- altpll_0:c0 -> modular_adc_0:adc_pll_clock_clk
	signal altpll_0_locked_conduit_export           : std_logic; -- altpll_0:locked -> modular_adc_0:adc_pll_locked_export
	signal altpll_0_phasedone_conduit_export        : std_logic; -- altpll_0:phasedone -> altpll_0:areset
	signal rst_controller_reset_out_reset           : std_logic; -- rst_controller:reset_out -> [altpll_0:reset, rst_controller_reset_out_reset:in]
	signal reset_reset_n_ports_inv                  : std_logic; -- reset_reset_n:inv -> rst_controller:reset_in0
	signal rst_controller_reset_out_reset_ports_inv : std_logic; -- rst_controller_reset_out_reset:inv -> modular_adc_0:reset_sink_reset_n

begin

	altpll_0 : component ADC_altpll_0
		port map (
			clk       => clk_clk,                           --       inclk_interface.clk
			reset     => rst_controller_reset_out_reset,    -- inclk_interface_reset.reset
			read      => open,                              --             pll_slave.read
			write     => open,                              --                      .write
			address   => open,                              --                      .address
			readdata  => open,                              --                      .readdata
			writedata => open,                              --                      .writedata
			c0        => altpll_0_c0_clk,                   --                    c0.clk
			areset    => altpll_0_phasedone_conduit_export, --        areset_conduit.export
			locked    => altpll_0_locked_conduit_export,    --        locked_conduit.export
			phasedone => altpll_0_phasedone_conduit_export  --     phasedone_conduit.export
		);

	modular_adc_0 : component ADC_modular_adc_0
		port map (
			clock_clk              => clk_clk,                                  --          clock.clk
			reset_sink_reset_n     => rst_controller_reset_out_reset_ports_inv, --     reset_sink.reset_n
			adc_pll_clock_clk      => altpll_0_c0_clk,                          --  adc_pll_clock.clk
			adc_pll_locked_export  => altpll_0_locked_conduit_export,           -- adc_pll_locked.export
			command_valid          => command_valid,                            --        command.valid
			command_channel        => command_channel,                          --               .channel
			command_startofpacket  => command_startofpacket,                    --               .startofpacket
			command_endofpacket    => command_endofpacket,                      --               .endofpacket
			command_ready          => command_ready,                            --               .ready
			response_valid         => response_valid,                           --       response.valid
			response_channel       => response_channel,                         --               .channel
			response_data          => response_data,                            --               .data
			response_startofpacket => response_startofpacket,                   --               .startofpacket
			response_endofpacket   => response_endofpacket                      --               .endofpacket
		);

	rst_controller : component altera_reset_controller
		generic map (
			NUM_RESET_INPUTS          => 1,
			OUTPUT_RESET_SYNC_EDGES   => "deassert",
			SYNC_DEPTH                => 2,
			RESET_REQUEST_PRESENT     => 0,
			RESET_REQ_WAIT_TIME       => 1,
			MIN_RST_ASSERTION_TIME    => 3,
			RESET_REQ_EARLY_DSRT_TIME => 1,
			USE_RESET_REQUEST_IN0     => 0,
			USE_RESET_REQUEST_IN1     => 0,
			USE_RESET_REQUEST_IN2     => 0,
			USE_RESET_REQUEST_IN3     => 0,
			USE_RESET_REQUEST_IN4     => 0,
			USE_RESET_REQUEST_IN5     => 0,
			USE_RESET_REQUEST_IN6     => 0,
			USE_RESET_REQUEST_IN7     => 0,
			USE_RESET_REQUEST_IN8     => 0,
			USE_RESET_REQUEST_IN9     => 0,
			USE_RESET_REQUEST_IN10    => 0,
			USE_RESET_REQUEST_IN11    => 0,
			USE_RESET_REQUEST_IN12    => 0,
			USE_RESET_REQUEST_IN13    => 0,
			USE_RESET_REQUEST_IN14    => 0,
			USE_RESET_REQUEST_IN15    => 0,
			ADAPT_RESET_REQUEST       => 0
		)
		port map (
			reset_in0      => reset_reset_n_ports_inv,        -- reset_in0.reset
			clk            => clk_clk,                        --       clk.clk
			reset_out      => rst_controller_reset_out_reset, -- reset_out.reset
			reset_req      => open,                           -- (terminated)
			reset_req_in0  => '0',                            -- (terminated)
			reset_in1      => '0',                            -- (terminated)
			reset_req_in1  => '0',                            -- (terminated)
			reset_in2      => '0',                            -- (terminated)
			reset_req_in2  => '0',                            -- (terminated)
			reset_in3      => '0',                            -- (terminated)
			reset_req_in3  => '0',                            -- (terminated)
			reset_in4      => '0',                            -- (terminated)
			reset_req_in4  => '0',                            -- (terminated)
			reset_in5      => '0',                            -- (terminated)
			reset_req_in5  => '0',                            -- (terminated)
			reset_in6      => '0',                            -- (terminated)
			reset_req_in6  => '0',                            -- (terminated)
			reset_in7      => '0',                            -- (terminated)
			reset_req_in7  => '0',                            -- (terminated)
			reset_in8      => '0',                            -- (terminated)
			reset_req_in8  => '0',                            -- (terminated)
			reset_in9      => '0',                            -- (terminated)
			reset_req_in9  => '0',                            -- (terminated)
			reset_in10     => '0',                            -- (terminated)
			reset_req_in10 => '0',                            -- (terminated)
			reset_in11     => '0',                            -- (terminated)
			reset_req_in11 => '0',                            -- (terminated)
			reset_in12     => '0',                            -- (terminated)
			reset_req_in12 => '0',                            -- (terminated)
			reset_in13     => '0',                            -- (terminated)
			reset_req_in13 => '0',                            -- (terminated)
			reset_in14     => '0',                            -- (terminated)
			reset_req_in14 => '0',                            -- (terminated)
			reset_in15     => '0',                            -- (terminated)
			reset_req_in15 => '0'                             -- (terminated)
		);

	reset_reset_n_ports_inv <= not reset_reset_n;

	rst_controller_reset_out_reset_ports_inv <= not rst_controller_reset_out_reset;

end architecture rtl; -- of ADC
