# Copyright 1991-2016 Mentor Graphics Corporation

onbreak {resume}

# create library
if [file exists work] {
    vdel -all
}
vlib work

# compile source files
vlog Game.sv muxximus.sv floppimus.sv datapath.sv Game_tb.sv

# start and run simulation
vsim -voptargs=+acc work.tb

view list
view wave

-- display input and output signals as hexidecimal values
# Diplays All Signals recursively
# add wave -hex -r /tb/*

add wave -hex /tb/dut/clk
add wave -hex /tb/dut/shift_seed
add wave -hex /tb/dut/muxDisplaySignal
add wave -hex /tb/dut/muxGameSignal
add wave -hex /tb/dut/GridOut

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
run 400 ns


