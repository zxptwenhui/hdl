
source $ad_hdl_dir/library/spi_engine/scripts/spi_engine.tcl
source $ad_hdl_dir/projects/common/zed/zed_system_bd.tcl

# specify the spi reference clock frequency in MHz
set spi_clk_ref_frequency 166

# specify ADC resolution -- supported resolutions 16/18/20 bits
set adc_resolution 20

# specify ADC sampling rate in samples/seconds

# NOTE: This rate can be set just in turbo mode -- if turbo mode is not used
# the max rate should be 1.6 MSPS
set adc_sampling_rate 1800000

set data_width 32
set async_spi_clk 1
set num_cs 1
set num_sdi 1
set sdi_delay 2
set hier_spi_engine spi_ad40xx

spi_engine_bd $hier_spi_engine $data_width $async_spi_clk $num_cs $num_sdi $sdi_delay

source ../common/ad40xx_bd.tcl

#system ID
ad_ip_parameter axi_sysid_0 CONFIG.ROM_ADDR_BITS 9
ad_ip_parameter rom_sys_0 CONFIG.PATH_TO_FILE "[pwd]/mem_init_sys.txt"
ad_ip_parameter rom_sys_0 CONFIG.ROM_ADDR_BITS 9
set sys_cstring "sys rom custom string placeholder"
sysid_gen_sys_init_file $sys_cstring
