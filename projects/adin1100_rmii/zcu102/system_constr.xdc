
set_property -dict {PACKAGE_PIN Y8   IOSTANDARD LVCMOS18} [get_ports rmii_rx_er]                 ; ## C22  FMC_HPC1_LA18_CC_P
set_property -dict {PACKAGE_PIN AB11 IOSTANDARD LVCMOS18} [get_ports rmii_rx_dv]                 ; ## G21  FMC_HPC1_LA20_P

set_property -dict {PACKAGE_PIN AC11 IOSTANDARD LVCMOS18} [get_ports {rmii_rxd[0]}]              ; ## H26  FMC_HPC1_LA21_N
set_property -dict {PACKAGE_PIN R12  IOSTANDARD LVCMOS18} [get_ports {rmii_rxd[1]}]              ; ## D27  FMC_HPC1_LA26_N

set_property -dict {PACKAGE_PIN Y5  IOSTANDARD LVCMOS18 SLEW FAST} [get_ports rmii_clk]          ; ## D20  FMC_HPC1_LA17_CC_P

set_property -dict {PACKAGE_PIN AH7  IOSTANDARD LVCMOS18 SLEW FAST} [get_ports rmii_tx_en]       ; ## C18  FMC_HPC1_LA14_P

set_property -dict {PACKAGE_PIN AF3  IOSTANDARD LVCMOS18 SLEW FAST} [get_ports {rmii_txd[0]}]    ; ## G13  FMC_HPC1_LA08_N
set_property -dict {PACKAGE_PIN AH3  IOSTANDARD LVCMOS18 SLEW FAST} [get_ports {rmii_txd[1]}]    ; ## D12  FMC_HPC1_LA05_N

set_property -dict {PACKAGE_PIN AG10 IOSTANDARD LVCMOS18 PULLUP true} [get_ports mdio_fmc]       ; ## G18  FMC_HPC1_LA16_P
set_property -dict {PACKAGE_PIN AG9  IOSTANDARD LVCMOS18} [get_ports mdc_fmc]                    ; ## G19  FMC_HPC1_LA16_N

set_property -dict {PACKAGE_PIN Y7   IOSTANDARD LVCMOS18} [get_ports link_st]                    ; ## C23  FMC_HPC1_LA18_CC_N
set_property -dict {PACKAGE_PIN AD10 IOSTANDARD LVCMOS18} [get_ports reset_n]                    ; ## H19  FMC_HPC1_LA15_P

create_clock -name mdio_clk_b -period 400.0 [get_pins i_system_wrapper/system_i/sys_ps8/inst/emio_enet1_mdio_mdc]

