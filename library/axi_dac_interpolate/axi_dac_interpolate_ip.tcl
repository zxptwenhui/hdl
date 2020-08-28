# ip

source ../scripts/adi_env.tcl
source $ad_hdl_dir/library/scripts/adi_ip_xilinx.tcl

adi_ip_create axi_dac_interpolate

    create_ip -name ila -vendor xilinx.com -library ip -version 6.2 -module_name int_ila
    set_property -dict [list CONFIG.C_MONITOR_TYPE {Native}] [get_ips int_ila]
    set_property -dict [list CONFIG.C_NUM_OF_PROBES {10}] [get_ips int_ila]
    set_property -dict [list CONFIG.C_DATA_DEPTH {4096}] [get_ips int_ila]
    set_property -dict [list CONFIG.C_TRIGIN_EN {false}] [get_ips int_ila]
    set_property -dict [list CONFIG.C_PROBE0_WIDTH {16}] [get_ips int_ila]
    set_property -dict [list CONFIG.C_PROBE1_WIDTH {16}] [get_ips int_ila]
    set_property -dict [list CONFIG.C_PROBE2_WIDTH {16}] [get_ips int_ila]
    set_property -dict [list CONFIG.C_PROBE6_WIDTH {16}] [get_ips int_ila]
    set_property -dict [list CONFIG.C_PROBE7_WIDTH {3}] [get_ips int_ila]
    set_property -dict [list CONFIG.C_PROBE8_WIDTH {4}] [get_ips int_ila]
    generate_target {all} [get_files axi_dac_interpolate.srcs/sources_1/ip/int_ila/int_ila.xci]

adi_ip_files axi_dac_interpolate [list \
  "$ad_hdl_dir/library/common/up_xfer_cntrl.v" \
  "$ad_hdl_dir/library/common/up_axi.v" \
  "$ad_hdl_dir/library/common/ad_iqcor.v" \
  "$ad_hdl_dir/library/xilinx/common/ad_mul.v" \
  "$ad_hdl_dir/library/xilinx/common/up_xfer_cntrl_constr.xdc" \
  "axi_dac_interpolate_constr.xdc" \
  "cic_interp.v" \
  "fir_interp.v" \
  "axi_dac_interpolate_reg.v" \
  "axi_dac_interpolate_filter.v" \
  "axi_dac_interpolate.v" ]

adi_ip_properties axi_dac_interpolate

ipx::infer_bus_interface dac_clk xilinx.com:signal:clock_rtl:1.0 [ipx::current_core]
ipx::infer_bus_interface dac_rst xilinx.com:signal:reset_rtl:1.0 [ipx::current_core]

ipx::save_core [ipx::current_core]

