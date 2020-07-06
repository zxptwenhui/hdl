
set_property -dict {PACKAGE_PIN AE27 IOSTANDARD LVCMOS25} [get_ports rmii_rx_er]                 ; ## C22  FMC_LPC_LA18_CC_P
set_property -dict {PACKAGE_PIN AG26 IOSTANDARD LVCMOS25} [get_ports rmii_rx_dv]                 ; ## G21  FMC_LPC_LA20_P

set_property -dict {PACKAGE_PIN AH29 IOSTANDARD LVCMOS25} [get_ports {rmii_rxd[0]}]              ; ## H26  FMC_LPC_LA21_N
set_property -dict {PACKAGE_PIN AK30 IOSTANDARD LVCMOS25} [get_ports {rmii_rxd[1]}]              ; ## D27  FMC_LPC_LA26_N

set_property -dict {PACKAGE_PIN AB27 IOSTANDARD LVCMOS25 SLEW FAST} [get_ports rmii_clk]         ; ## D20  FMC_LPC_LA17_CC_P

set_property -dict {PACKAGE_PIN AF18 IOSTANDARD LVCMOS25 SLEW FAST} [get_ports rmii_tx_en]       ; ## C18  FMC_LPC_LA14_P

set_property -dict {PACKAGE_PIN AD13 IOSTANDARD LVCMOS25 SLEW FAST} [get_ports {rmii_txd[0]}]    ; ## G13  FMC_LPC_LA08_N
set_property -dict {PACKAGE_PIN AE15 IOSTANDARD LVCMOS25 SLEW FAST} [get_ports {rmii_txd[1]}]    ; ## D12  FMC_LPC_LA05_N

set_property -dict {PACKAGE_PIN AE18 IOSTANDARD LVCMOS25 PULLUP true} [get_ports mdio_fmc]       ; ## G18  FMC_LPC_LA16_P
set_property -dict {PACKAGE_PIN AE17 IOSTANDARD LVCMOS25} [get_ports mdc_fmc]                    ; ## G19  FMC_LPC_LA16_N

set_property -dict {PACKAGE_PIN AF27 IOSTANDARD LVCMOS25} [get_ports link_st]                    ; ## C23  FMC_LPC_LA18_CC_N
set_property -dict {PACKAGE_PIN AB15 IOSTANDARD LVCMOS25} [get_ports reset_n]                    ; ## H19  FMC_LPC_LA15_P

