# SCL Configs
set ::env(MAX_FANOUT_CONSTRAINT) 6
set ::env(FP_CORE_UTIL) 35
set ::env(PL_TARGET_DENSITY) [ expr ($::env(FP_CORE_UTIL)+5) / 100.0 ]


# Suggested Clock Period:
set ::env(CLOCK_PERIOD) "26.03"
