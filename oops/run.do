vlib work
vlog adv1.sv
vsim -novopt -suppress 12110 tb 
#add wave -position insertpoint sim:/top/*
#do wave.do
run -all
