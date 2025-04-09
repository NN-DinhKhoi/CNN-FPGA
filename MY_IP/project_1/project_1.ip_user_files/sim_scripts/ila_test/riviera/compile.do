transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -incr "+incdir+../../../../project_1.gen/sources_1/ip/ila_test/hdl/verilog" -l xpm -l xil_defaultlib \
"D:/GiaPhuc/Vivado/Vivado/2024.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/GiaPhuc/Vivado/Vivado/2024.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"D:/GiaPhuc/Vivado/Vivado/2024.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../project_1.gen/sources_1/ip/ila_test/hdl/verilog" -l xpm -l xil_defaultlib \
"../../../../project_1.gen/sources_1/ip/ila_test/sim/ila_test.v" \

vlog -work xil_defaultlib \
"glbl.v"

