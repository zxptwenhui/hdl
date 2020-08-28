# ip

source ../scripts/adi_env.tcl
source $ad_hdl_dir/library/scripts/adi_ip_xilinx.tcl

adi_ip_create axi_ad9963

    create_ip -name ila -vendor xilinx.com -library ip -version 6.2 -module_name my_ila
    set_property -dict [list CONFIG.C_MONITOR_TYPE {Native}] [get_ips my_ila]
    set_property -dict [list CONFIG.C_NUM_OF_PROBES {7}] [get_ips my_ila]
    set_property -dict [list CONFIG.C_DATA_DEPTH {2048}] [get_ips my_ila]
    set_property -dict [list CONFIG.C_TRIGIN_EN {false}] [get_ips my_ila]
    set_property -dict [list CONFIG.C_PROBE0_WIDTH {12}] [get_ips my_ila]
    set_property -dict [list CONFIG.C_PROBE1_WIDTH {12}] [get_ips my_ila]
    set_property -dict [list CONFIG.C_PROBE2_WIDTH {12}] [get_ips my_ila]
    set_property -dict [list CONFIG.C_PROBE3_WIDTH {12}] [get_ips my_ila]
    set_property -dict [list CONFIG.C_PROBE4_WIDTH {12}] [get_ips my_ila]
    set_property -dict [list CONFIG.C_PROBE5_WIDTH {1}] [get_ips my_ila]
    set_property -dict [list CONFIG.C_PROBE6_WIDTH {1}] [get_ips my_ila]
    generate_target {all} [get_files axi_ad9963.srcs/sources_1/ip/my_ila/my_ila.xci]

adi_ip_files axi_ad9963 [list \
  "$ad_hdl_dir/library/xilinx/common/up_xfer_cntrl_constr.xdc" \
  "$ad_hdl_dir/library/xilinx/common/ad_rst_constr.xdc" \
  "$ad_hdl_dir/library/xilinx/common/up_xfer_status_constr.xdc" \
  "$ad_hdl_dir/library/xilinx/common/up_clock_mon_constr.xdc" \
  "$ad_hdl_dir/library/common/ad_rst.v" \
  "$ad_hdl_dir/library/xilinx/common/ad_data_in.v" \
  "$ad_hdl_dir/library/xilinx/common/ad_dcfilter.v" \
  "$ad_hdl_dir/library/xilinx/common/ad_mul.v" \
  "$ad_hdl_dir/library/common/ad_pnmon.v" \
  "$ad_hdl_dir/library/common/ad_dds_cordic_pipe.v" \
  "$ad_hdl_dir/library/common/ad_dds_sine_cordic.v" \
  "$ad_hdl_dir/library/common/ad_dds_sine.v" \
  "$ad_hdl_dir/library/common/ad_dds_2.v" \
  "$ad_hdl_dir/library/common/ad_dds_1.v" \
  "$ad_hdl_dir/library/common/ad_dds.v" \
  "$ad_hdl_dir/library/common/ad_datafmt.v" \
  "$ad_hdl_dir/library/common/ad_iqcor.v" \
  "$ad_hdl_dir/library/common/up_axi.v" \
  "$ad_hdl_dir/library/common/up_xfer_cntrl.v" \
  "$ad_hdl_dir/library/common/up_xfer_status.v" \
  "$ad_hdl_dir/library/common/up_clock_mon.v" \
  "$ad_hdl_dir/library/common/up_delay_cntrl.v" \
  "$ad_hdl_dir/library/common/up_adc_common.v" \
  "$ad_hdl_dir/library/common/up_adc_channel.v" \
  "$ad_hdl_dir/library/common/up_dac_common.v" \
  "$ad_hdl_dir/library/common/up_dac_channel.v" \
  "axi_ad9963_constr.xdc" \
  "axi_ad9963_if.v" \
  "axi_ad9963_rx_pnmon.v" \
  "axi_ad9963_rx_channel.v" \
  "axi_ad9963_rx.v" \
  "axi_ad9963_tx_channel.v" \
  "axi_ad9963_tx.v" \
  "axi_ad9963.v" ]

adi_ip_properties axi_ad9963

adi_init_bd_tcl
adi_ip_bd axi_ad9963 "bd/bd.tcl"

set_property driver_value 0 [ipx::get_ports *dac_sync_in* -of_objects [ipx::current_core]]
set_property driver_value 0 [ipx::get_ports *dovf* -of_objects [ipx::current_core]]
set_property driver_value 0 [ipx::get_ports *dunf* -of_objects [ipx::current_core]]

adi_set_ports_dependency "delay_clk" \
  "(spirit:decode(id('MODELPARAM_VALUE.ADC_IODELAY_ENABLE')) = 1)" 0

ipx::infer_bus_interface trx_clk xilinx.com:signal:clock_rtl:1.0 [ipx::current_core]
ipx::infer_bus_interface tx_clk xilinx.com:signal:clock_rtl:1.0 [ipx::current_core]
ipx::infer_bus_interface delay_clk xilinx.com:signal:clock_rtl:1.0 [ipx::current_core]

ipx::infer_bus_interface adc_clk xilinx.com:signal:clock_rtl:1.0 [ipx::current_core]
ipx::infer_bus_interface adc_rst xilinx.com:signal:reset_rtl:1.0 [ipx::current_core]

ipx::infer_bus_interface dac_clk xilinx.com:signal:clock_rtl:1.0 [ipx::current_core]
ipx::infer_bus_interface dac_rst xilinx.com:signal:reset_rtl:1.0 [ipx::current_core]

adi_add_auto_fpga_spec_params
ipx::create_xgui_files [ipx::current_core]

ipx::save_core [ipx::current_core]

