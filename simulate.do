############################################################
# Clean build
############################################################

if {[file exists work]} {
    vdel -lib work -all
}

vlib work
vmap work work

############################################################
# Compile RTL
############################################################

echo "Compiling COMMON modules..."
vlog -sv rtl/common/*.sv

echo "Compiling CONTROL modules..."
vlog -sv rtl/single_cycle/control/*.sv

echo "Compiling DATAPATH modules..."
vlog -sv rtl/single_cycle/datapath/*.sv

echo "Compiling MEMORY modules..."
vlog -sv rtl/single_cycle/memory/*.sv

echo "Compiling TOP modules..."
vlog -sv rtl/single_cycle/*.sv

############################################################
# Compile testbench
############################################################

echo "Compiling Testbench..."
vlog -sv tb/*.sv

############################################################
# Run simulation
############################################################

echo "Starting simulation..."
vsim -voptargs=+acc -c cpu_tb


vcd file wave.vcd
vcd add -r sim:/cpu_tb/*

run -all
vcd flush

quit