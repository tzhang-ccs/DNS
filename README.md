# Install DNS in FASTER

# Get software configuration

```bash
git clone git@github.com:eexcalibur/DNS_install.git

cp DNS_install/faster/CMakeLists.txt  DNS/
cp DNS_install/faster/cmake-modules/*  DNS/
cp DNS_install/faster/run_DNS.sh DNS/climate
```

# Compile

```bash
cmake -DCMAKE_CXX_COMPILER=mpicxx   -DCMAKE_C_COMPILER=mpicc  .
make -j16

```

# run

```bash
cd climate; qsub run_DNS.sh
```