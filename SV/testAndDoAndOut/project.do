# Copyright 1991-2016 Mentor Graphics Corporation

onbreak {resume}

# create library
if [file exists work] {
    vdel -all
}
vlib work

# compile source files
vlog project_tb.sv fsm.sv projectimus.sv lfsr.sv Game.sv muxximus.sv floppimus.sv datapath.sv 

# start and run simulation
vsim -voptargs=+acc work.tb

view list
view wave

-- display input and output signals as hexidecimal values
# Diplays All Signals recursively
# add wave -hex -r /tb/*

add wave -hex /tb/dut/clk
add wave -hex /tb/dut/seed
add wave -hex /tb/dut/fsmReset
add wave -hex /tb/dut/sw0
add wave -hex /tb/dut/sw1
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
run 1000 ns


