set_property SRC_FILE_INFO {cfile:/home/sogang/Desktop/riscv_platform_1020/riscv32im_soc/hw/impl.ip_integrator/zed.confmc/project_design_riscv_cache/project_design_riscv_cache.gen/sources_1/bd/design_riscv_cache/ip/design_riscv_cache_clk_wiz_0_0/design_riscv_cache_clk_wiz_0_0.xdc rfile:../project_design_riscv_cache/project_design_riscv_cache.gen/sources_1/bd/design_riscv_cache/ip/design_riscv_cache_clk_wiz_0_0/design_riscv_cache_clk_wiz_0_0.xdc id:1 order:EARLY scoped_inst:design_riscv_cache_i/clk_wiz_0/inst} [current_design]
set_property SRC_FILE_INFO {cfile:/home/sogang/Desktop/riscv_platform_1020/riscv32im_soc/hw/impl.ip_integrator/zed.confmc/xdc/con-fmc_lpc_zed.xdc rfile:../xdc/con-fmc_lpc_zed.xdc id:2} [current_design]
set_property SRC_FILE_INFO {cfile:/home/sogang/Desktop/riscv_platform_1020/riscv32im_soc/hw/impl.ip_integrator/zed.confmc/xdc/fpga_zed.xdc rfile:../xdc/fpga_zed.xdc id:3} [current_design]
set_property SRC_FILE_INFO {cfile:/tools/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl rfile:../../../../../../../../../tools/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl id:4 order:LATE scoped_inst:design_riscv_cache_i/bfm_axi_if_0/inst/u_bfm_axi/u_gpif2mst/u_cu2f/WIDTH_32.BLK_512.u_fifo/U0/inst_fifo_gen/gaxis_fifo.gaxisf.axisf/grf.rf/gntv_or_sync_fifo.gcx.clkx/rd_pntr_cdc_inst unmanaged:yes} [current_design]
set_property SRC_FILE_INFO {cfile:/tools/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl rfile:../../../../../../../../../tools/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl id:5 order:LATE scoped_inst:design_riscv_cache_i/bfm_axi_if_0/inst/u_bfm_axi/u_gpif2mst/u_du2f/WIDTH_32.BLK_512.u_fifo/U0/inst_fifo_gen/gaxis_fifo.gaxisf.axisf/grf.rf/gntv_or_sync_fifo.gcx.clkx/rd_pntr_cdc_inst unmanaged:yes} [current_design]
set_property SRC_FILE_INFO {cfile:/tools/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl rfile:../../../../../../../../../tools/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl id:6 order:LATE scoped_inst:design_riscv_cache_i/bfm_axi_if_0/inst/u_bfm_axi/u_gpif2mst/u_cu2f/WIDTH_32.BLK_512.u_fifo/U0/inst_fifo_gen/gaxis_fifo.gaxisf.axisf/grf.rf/gntv_or_sync_fifo.gcx.clkx/wr_pntr_cdc_inst unmanaged:yes} [current_design]
set_property SRC_FILE_INFO {cfile:/tools/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl rfile:../../../../../../../../../tools/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl id:7 order:LATE scoped_inst:design_riscv_cache_i/bfm_axi_if_0/inst/u_bfm_axi/u_gpif2mst/u_du2f/WIDTH_32.BLK_512.u_fifo/U0/inst_fifo_gen/gaxis_fifo.gaxisf.axisf/grf.rf/gntv_or_sync_fifo.gcx.clkx/wr_pntr_cdc_inst unmanaged:yes} [current_design]
set_property SRC_FILE_INFO {cfile:/tools/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl rfile:../../../../../../../../../tools/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl id:8 order:LATE scoped_inst:design_riscv_cache_i/bfm_axi_if_0/inst/u_bfm_axi/u_gpif2mst/u_df2u/WIDTH_34.BLK_512.u_fifo/U0/inst_fifo_gen/gaxis_fifo.gaxisf.axisf/grf.rf/gntv_or_sync_fifo.gcx.clkx/rd_pntr_cdc_inst unmanaged:yes} [current_design]
set_property SRC_FILE_INFO {cfile:/tools/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl rfile:../../../../../../../../../tools/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl id:9 order:LATE scoped_inst:design_riscv_cache_i/bfm_axi_if_0/inst/u_bfm_axi/u_gpif2mst/u_df2u/WIDTH_34.BLK_512.u_fifo/U0/inst_fifo_gen/gaxis_fifo.gaxisf.axisf/grf.rf/gntv_or_sync_fifo.gcx.clkx/wr_pntr_cdc_inst unmanaged:yes} [current_design]
current_instance design_riscv_cache_i/clk_wiz_0/inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.100
current_instance
set_property src_info {type:XDC file:2 line:26 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN H15 [get_ports {SL_DT[21]}]
set_property src_info {type:XDC file:2 line:28 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN J16 [get_ports {SL_DT[23]}]
set_property src_info {type:XDC file:2 line:29 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN J17 [get_ports {SL_DT[24]}]
set_property src_info {type:XDC file:2 line:30 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN J18 [get_ports {SL_DT[25]}]
set_property src_info {type:XDC file:2 line:31 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN J20 [get_ports {SL_DT[26]}]
set_property src_info {type:XDC file:2 line:36 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN K18 [get_ports {SL_DT[31]}]
set_property src_info {type:XDC file:2 line:41 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN J21 [get_ports SL_PCLK]
set_property src_info {type:XDC file:2 line:42 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN J22 [get_ports SL_CS_N]
set_property src_info {type:XDC file:2 line:55 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN J15 [get_ports {SL_MODE[1]}]
set_property src_info {type:XDC file:2 line:99 export:INPUT save:INPUT read:READ} [current_design]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {SL_MODE_IBUF[0]}]
set_property src_info {type:XDC file:2 line:102 export:INPUT save:INPUT read:READ} [current_design]
set_property IOB TRUE  [get_cells {u_dut/u_bfm_axi/u_gpif2mst/SL_DT_O reg*}]
set_property src_info {type:XDC file:2 line:103 export:INPUT save:INPUT read:READ} [current_design]
set_property IOB TRUE  [get_cells {u_dut/u_bfm_axi/u_gpif2mst/SL_RD_N_reg}]
set_property src_info {type:XDC file:2 line:104 export:INPUT save:INPUT read:READ} [current_design]
set_property IOB TRUE  [get_cells {u_dut/u_bfm_axi/u_gpif2mst/SL_WR_N_reg}]
set_property src_info {type:XDC file:2 line:105 export:INPUT save:INPUT read:READ} [current_design]
set_property IOB TRUE  [get_cells {u_dut/u_bfm_axi/u_gpif2mst/SL_OE_N_reg}]
set_property src_info {type:XDC file:2 line:106 export:INPUT save:INPUT read:READ} [current_design]
set_property IOB TRUE  [get_cells {u_dut/u_bfm_axi/u_gpif2mst/SL_PKTEND_N_reg}]
set_property src_info {type:XDC file:2 line:107 export:INPUT save:INPUT read:READ} [current_design]
set_property IOB TRUE  [get_cells {u_dut/u_bfm_axi/u_gpif2mst/SL_AD_reg*}]
set_property src_info {type:XDC file:3 line:12 export:INPUT save:INPUT read:READ} [current_design]
set_false_path -reset_path -from [get_ports BOARD_RST_SW]
set_property src_info {type:XDC file:3 line:50 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS33 [get_ports gpio_in[3:0]]
set_property src_info {type:XDC file:3 line:58 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS33 [get_ports gpio_out[7:4]]
current_instance design_riscv_cache_i/bfm_axi_if_0/inst/u_bfm_axi/u_gpif2mst/u_cu2f/WIDTH_32.BLK_512.u_fifo/U0/inst_fifo_gen/gaxis_fifo.gaxisf.axisf/grf.rf/gntv_or_sync_fifo.gcx.clkx/rd_pntr_cdc_inst
set_property src_info {type:SCOPED_XDC file:4 line:23 export:INPUT save:NONE read:READ} [current_design]
create_waiver -internal -scoped -type CDC -id {CDC-6} -user "xpm_cdc" -tags "1009444" -desc "The CDC-6 warning is waived as it is safe in the context of XPM_CDC_GRAY." -from [get_pins -quiet {src_gray_ff_reg*/C}] -to [get_pins -quiet {dest_graysync_ff_reg*/D}]
current_instance
current_instance design_riscv_cache_i/bfm_axi_if_0/inst/u_bfm_axi/u_gpif2mst/u_du2f/WIDTH_32.BLK_512.u_fifo/U0/inst_fifo_gen/gaxis_fifo.gaxisf.axisf/grf.rf/gntv_or_sync_fifo.gcx.clkx/rd_pntr_cdc_inst
set_property src_info {type:SCOPED_XDC file:5 line:23 export:INPUT save:NONE read:READ} [current_design]
create_waiver -internal -scoped -type CDC -id {CDC-6} -user "xpm_cdc" -tags "1009444" -desc "The CDC-6 warning is waived as it is safe in the context of XPM_CDC_GRAY." -from [get_pins -quiet {src_gray_ff_reg*/C}] -to [get_pins -quiet {dest_graysync_ff_reg*/D}]
current_instance
current_instance design_riscv_cache_i/bfm_axi_if_0/inst/u_bfm_axi/u_gpif2mst/u_cu2f/WIDTH_32.BLK_512.u_fifo/U0/inst_fifo_gen/gaxis_fifo.gaxisf.axisf/grf.rf/gntv_or_sync_fifo.gcx.clkx/wr_pntr_cdc_inst
set_property src_info {type:SCOPED_XDC file:6 line:23 export:INPUT save:NONE read:READ} [current_design]
create_waiver -internal -scoped -type CDC -id {CDC-6} -user "xpm_cdc" -tags "1009444" -desc "The CDC-6 warning is waived as it is safe in the context of XPM_CDC_GRAY." -from [get_pins -quiet {src_gray_ff_reg*/C}] -to [get_pins -quiet {dest_graysync_ff_reg*/D}]
current_instance
current_instance design_riscv_cache_i/bfm_axi_if_0/inst/u_bfm_axi/u_gpif2mst/u_du2f/WIDTH_32.BLK_512.u_fifo/U0/inst_fifo_gen/gaxis_fifo.gaxisf.axisf/grf.rf/gntv_or_sync_fifo.gcx.clkx/wr_pntr_cdc_inst
set_property src_info {type:SCOPED_XDC file:7 line:23 export:INPUT save:NONE read:READ} [current_design]
create_waiver -internal -scoped -type CDC -id {CDC-6} -user "xpm_cdc" -tags "1009444" -desc "The CDC-6 warning is waived as it is safe in the context of XPM_CDC_GRAY." -from [get_pins -quiet {src_gray_ff_reg*/C}] -to [get_pins -quiet {dest_graysync_ff_reg*/D}]
current_instance
current_instance design_riscv_cache_i/bfm_axi_if_0/inst/u_bfm_axi/u_gpif2mst/u_df2u/WIDTH_34.BLK_512.u_fifo/U0/inst_fifo_gen/gaxis_fifo.gaxisf.axisf/grf.rf/gntv_or_sync_fifo.gcx.clkx/rd_pntr_cdc_inst
set_property src_info {type:SCOPED_XDC file:8 line:23 export:INPUT save:NONE read:READ} [current_design]
create_waiver -internal -scoped -type CDC -id {CDC-6} -user "xpm_cdc" -tags "1009444" -desc "The CDC-6 warning is waived as it is safe in the context of XPM_CDC_GRAY." -from [get_pins -quiet {src_gray_ff_reg*/C}] -to [get_pins -quiet {dest_graysync_ff_reg*/D}]
current_instance
current_instance design_riscv_cache_i/bfm_axi_if_0/inst/u_bfm_axi/u_gpif2mst/u_df2u/WIDTH_34.BLK_512.u_fifo/U0/inst_fifo_gen/gaxis_fifo.gaxisf.axisf/grf.rf/gntv_or_sync_fifo.gcx.clkx/wr_pntr_cdc_inst
set_property src_info {type:SCOPED_XDC file:9 line:23 export:INPUT save:NONE read:READ} [current_design]
create_waiver -internal -scoped -type CDC -id {CDC-6} -user "xpm_cdc" -tags "1009444" -desc "The CDC-6 warning is waived as it is safe in the context of XPM_CDC_GRAY." -from [get_pins -quiet {src_gray_ff_reg*/C}] -to [get_pins -quiet {dest_graysync_ff_reg*/D}]
