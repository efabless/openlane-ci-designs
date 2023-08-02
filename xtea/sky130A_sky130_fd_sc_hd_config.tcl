# SCL Configs
set ::env(CLOCK_PERIOD) "26.03"
set ::env(FP_CORE_UTIL) 45
set ::env(MAX_FANOUT_CONSTRAINT) 6
set ::env(PL_TARGET_DENSITY) [ expr ($::env(FP_CORE_UTIL)+5) / 100.0 ]

set ::env(RUN_HEURISTIC_DIODE_INSERTION) 1
set ::env(DIODE_ON_PORTS) "in"
