vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/xil_defaultlib

vmap xpm questa_lib/msim/xpm
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xpm  -incr -mfcu  -sv "+incdir+../../../../tmp_edit_project.gen/sources_1/ip/ila_test/hdl/verilog" \
"D:/GiaPhuc/Vivado/Vivado/2024.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/GiaPhuc/Vivado/Vivado/2024.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93  \
"D:/GiaPhuc/Vivado/Vivado/2024.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../tmp_edit_project.gen/sources_1/ip/ila_test/hdl/verilog" \
"../../../../tmp_edit_project.gen/sources_1/ip/ila_test/sim/ila_test.v" \

vlog -work xil_defaultlib \
"glbl.v"

