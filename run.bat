@echo off

echo Running simulation...

vsim -c -do simulate.do -l sim.log

echo Simulation finished. Output saved to sim.log

pause