#!/bin/csh

set mon = 01

# Export the mon variable as an environment variable to the link script
setenv MON $mon
source link_inputs.csh
cp /glade/scratch/ebasu/ICBC/static_GHG/2015/2015${mon}/wrf*d01 /glade/scratch/ebasu/ICBC/processing/WRF/
./mozbc < CAPS.inp > log.out

mkdir -p /glade/scratch/ebasu/ICBC/modelready_ICBC/CAPS/2015${mon} && mv /glade/scratch/ebasu/ICBC/processing/WRF/wrf* /glade/scratch/ebasu/ICBC/modelready_ICBC/2015${mon}/
