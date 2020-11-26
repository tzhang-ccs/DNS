# basic environment
```bash
conda create -n dns python=3.8
conda activate dns

conda install -c eumetsat fftw3
conda install -c conda-forge libgd
conda install -c birdhouse/label/non-commercial szip
```

# install hdf4
```bash
./configure --prefix=/global/homes/z/zhangtao/soft/hdf-4.2.14/ins --with-jpeg=/global/homes/z/zhangtao/soft/jpeg-9c/ins
```

# install petsc
```bash
./configure --prefix=/software/petsc   --download-hypre   --download-fblaslapack --with-mpi-dir=/software/openmpi/1.6.5-intel   PETSC_ARCH=linux-gnu-intel --download-hdf5
```

# config
```bash
cmake -DCMAKE_CXX_COMPILER=CC   -DCMAKE_C_COMPILER=cc  .
```
# edit a bug
/global/cscratch1/sd/zhangtao/acme_scratch/DNS/climate/vcartsn.cpp, line 612, line 410, int to long long 

# compile and run 
make -j16

srun -n  256  /global/cscratch1/sd/zhangtao/acme_scratch/DNS/climate/climate -d 3 -p 8 8 4 -i  input-cluster/in-cluster3dR10N    -o out-cluster3dR10N |& tee srun.log

## vtune:
srun -n  256  vtune -c hotspots -r /global/cscratch1/sd/zhangtao/DNS/climate/out-cluster3dR10N/vtune/hotspots_256 /global/cscratch1/sd/zhangtao/DNS/climate/climate -d 3 -p 8 8 4 -i input-cluster-edit/in-cluster3dR10N-large -o out-cluster3dR10N |& tee srun.log

