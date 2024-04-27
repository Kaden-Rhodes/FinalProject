# Copyright 1991-2016 Mentor Graphics Corporation

onbreak {resume}

# create library
if [file exists work] {
    vdel -all
}
vlib work

# compile source files
vlog Game.sv mux.sv flop.sv datapath.sv Game_tb.sv

# start and run simulation
vsim -voptargs=+acc work.tb

view list
view wave

-- display input and output signals as hexidecimal values
# Diplays All Signals recursively
# add wave -hex -r /tb/*
add wave -noupdate -divider -height 32 "Clock Divider"
add wave -hex /tb/dut/clk
add wave -hex /tb/dut/rst
add wave -hex /tb/dut/

add list -hex -r /tb/*
add log -r /*

-- Set Wave Output Items 
TreeUpdate [SetDefaultTree]
WaveRestoreZoom {0 ps} {75 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2

-- Run the Simulation
run 1200 ms


