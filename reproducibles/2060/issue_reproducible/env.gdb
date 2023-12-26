set env CELL_PAD_EXCLUDE gf180mcu_fd_sc_mcu9t5v0__filltie gf180mcu_fd_sc_mcu9t5v0__fill_* gf180mcu_fd_sc_mcu9t5v0__endcap
set env CLOCK_WIRE_RC_LAYER Metal4
set env CURRENT_DEF ./tmp/placement/10-global.def
set env CURRENT_NETLIST ./tmp/placement/10-global.nl.v
set env CURRENT_ODB ./tmp/placement/10-global.odb
set env CURRENT_POWERED_NETLIST ./tmp/placement/10-global.pnl.v
set env DATA_WIRE_RC_LAYER Metal2
set env DESIGN_NAME grid_clb
set env DIODE_CELL gf180mcu_fd_sc_mcu9t5v0__antenna
set env DIODE_PADDING 2
set env DONT_USE_CELLS 
set env DPL_CELL_PADDING 0
set env FP_PDN_ENABLE_GLOBAL_CONNECTIONS 1
set env FP_PDN_ENABLE_MACROS_GRID 1
set env GND_NET VSS
set env LIB_TYPICAL pdk/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu9t5v0/liberty/gf180mcu_fd_sc_mcu9t5v0__tt_025C_5v00.lib
set env MAX_FANOUT_CONSTRAINT 10
set env MAX_TRANSITION_CONSTRAINT 3
set env MERGED_LEF ./tmp/merged.nom.lef
set env OUTPUT_CAP_LOAD 72.91
set env PACKAGED_SCRIPT_0 openlane/scripts/openroad/resizer.tcl
set env PACKAGED_SCRIPT_1 openlane/scripts/openroad/common/io.tcl
set env PACKAGED_SCRIPT_2 openlane/scripts/openroad/common/set_rc.tcl
set env PACKAGED_SCRIPT_3 openlane/scripts/openroad/common/resizer.tcl
set env PACKAGED_SCRIPT_4 openlane/scripts/openroad/common/dpl_cell_pad.tcl
set env PACKAGED_SCRIPT_5 ./tmp/placement/12-resizer.sdc
set env PACKAGED_SCRIPT_6 openlane/scripts/openroad/common/set_global_connections.tcl
set env PL_OPTIMIZE_MIRRORING 1
set env PL_RESIZER_BUFFER_INPUT_PORTS 1
set env PL_RESIZER_BUFFER_OUTPUT_PORTS 1
set env PL_RESIZER_MAX_CAP_MARGIN 20
set env PL_RESIZER_MAX_SLEW_MARGIN 20
set env PL_RESIZER_MAX_WIRE_LENGTH 0
set env PL_RESIZER_REPAIR_TIE_FANOUT 1
set env PL_RESIZER_TIE_SEPERATION 0
set env PNR_SDC_FILE home/yunus/caravel_user_project/openlane/fpga_core_v2/grid_clb.tcon
set env PROCESS_CORNER nom
set env RSZ_DONT_TOUCH 
set env RSZ_DONT_TOUCH_RX \$^
set env RSZ_LIB pdk/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu9t5v0/liberty/gf180mcu_fd_sc_mcu9t5v0__tt_025C_5v00.lib pdk/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/liberty/gf180mcu_fd_sc_mcu7t5v0__tt_025C_5v00.lib
set env RSZ_LIB_FASTEST pdk/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu9t5v0/liberty/gf180mcu_fd_sc_mcu9t5v0__ff_n40C_5v50.lib
set env RSZ_LIB_SLOWEST pdk/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu9t5v0/liberty/gf180mcu_fd_sc_mcu9t5v0__ss_125C_4v50.lib
set env RSZ_MULTICORNER_LIB 1
set env SAVE_DEF ./tmp/placement/12-resizer.def
set env SAVE_NETLIST ./out.v
set env SAVE_ODB ./tmp/placement/12-resizer.odb
set env SAVE_POWERED_NETLIST ./tmp/placement/12-resizer.pnl.v
set env SAVE_SDC ./tmp/placement/12-resizer.sdc
set env SCRIPTS_DIR openlane/scripts
set env SIGNOFF_SDC_FILE home/yunus/caravel_user_project/openlane/fpga_core_v2/grid_clb.tcon
set env STA_PRE_CTS 1
set env STD_CELL_GROUND_PINS VSS VPW
set env STD_CELL_POWER_PINS VDD VNW
set env SYNTH_TIEHI_PORT gf180mcu_fd_sc_mcu9t5v0__tieh Z
set env SYNTH_TIELO_PORT gf180mcu_fd_sc_mcu9t5v0__tiel ZN
set env VDD_NET VDD