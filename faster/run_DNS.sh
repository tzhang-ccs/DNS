#PBS -q batch
#PBS -l nodes=2:ppn=64
#PBS -l walltime=960:00:00
#PBS -j oe
#PBS -N DNS
#PBS -o /home/tzhang/tmp/$PBS_JOBID.out

ulimit -s unlimited

#source /home/tzhang/.zshrc
export LD_LIBRARY_PATH=/software/libjpeg/lib:/software/openmpi/1.6.5-intel/lib:/software/hdf4/hdf4/lib:/software/intel/lib/intel64:$LD_LIBRARY_PATH

cd /home/thang/DNS/climate/
/software/openmpi/1.6.5-intel/bin/mpirun  --mca btl openib,self -np 64 ./climate -d 3 -p 4 4 4 -i input-cmw-test/in-cmw-test-zt -o out-cmw
