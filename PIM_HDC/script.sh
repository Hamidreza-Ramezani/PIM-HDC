#! /usr/sh


make clean >/dev/null
make NR_DPUS=16 NR_TASKLETS=7 SHOW_DPU_LOGS=0 >/dev/null
sudo ./pim_hdc -i data/tiny-data.bin -t

make clean >/dev/null
make NR_DPUS=256 NR_TASKLETS=14 SHOW_DPU_LOGS=0 >/dev/null
sudo ./pim_hdc -i data/large-data.bin -t

make clean >/dev/null
make NR_DPUS=512 NR_TASKLETS=12 SHOW_DPU_LOGS=0 >/dev/null
sudo ./pim_hdc -i data/large8-data.bin -t

