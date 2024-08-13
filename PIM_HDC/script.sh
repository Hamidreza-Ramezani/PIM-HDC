#! /usr/sh

dataset_path="/data/hamid/hdc-dataset"


make clean >/dev/null
make NR_DPUS=12 NR_TASKLETS=15 SHOW_DPU_LOGS=0 >/dev/null
sudo ./pim_hdc -i $dataset_path/tiny-data.bin -t

make clean >/dev/null
make NR_DPUS=256 NR_TASKLETS=18 SHOW_DPU_LOGS=0 >/dev/null
sudo ./pim_hdc -i $dataset_path/large-data.bin -t

make clean >/dev/null
make  SAMPLES_IN_MRAM=1 HDC_MAX_INPUT=960 NR_DPUS=512 NR_TASKLETS=18 SHOW_DPU_LOGS=0 >/dev/null
sudo ./pim_hdc -i $dataset_path/large8-data.bin -t


make clean >/dev/null
make  SAMPLES_IN_MRAM=1 HDC_MAX_INPUT=1900 NR_DPUS=1024 NR_TASKLETS=18 SHOW_DPU_LOGS=0 >/dev/null
sudo ./pim_hdc -i $dataset_path/large32-data.bin -t
#
#
#make clean >/dev/null
#make  SAMPLES_IN_MRAM=1 HDC_MAX_INPUT=6640 NR_DPUS=2304 NR_TASKLETS=18 SHOW_DPU_LOGS=0 >/dev/null
#sudo ./pim_hdc -i $dataset_path/large256-data.bin -t


#make clean >/dev/null
#make  SAMPLES_IN_MRAM=1 HDC_MAX_INPUT=26480 NR_DPUS=2304 NR_TASKLETS=18 SHOW_DPU_LOGS=0 >/dev/null
#sudo ./pim_hdc -i $dataset_path/large1024-data.bin -t


#make clean >/dev/null
#make  SAMPLES_IN_MRAM=1 HDC_MAX_INPUT=52940 NR_DPUS=2304 NR_TASKLETS=18 SHOW_DPU_LOGS=0 >/dev/null
#sudo ./pim_hdc -i $dataset_path/large2048-data.bin -t


#make clean >/dev/null
#make NR_DPUS=12 NR_TASKLETS=15 SHOW_DPU_LOGS=0 >/dev/null
#sudo ./pim_hdc -i $dataset_path/tiny-data.bin
#
#make clean >/dev/null
#make NR_DPUS=256 NR_TASKLETS=18 SHOW_DPU_LOGS=0 >/dev/null
#sudo ./pim_hdc -i $dataset_path/large-data.bin
#
#make clean >/dev/null
#make  SAMPLES_IN_MRAM=1 HDC_MAX_INPUT=960 NR_DPUS=512 NR_TASKLETS=18 SHOW_DPU_LOGS=0 >/dev/null
#sudo ./pim_hdc -i $dataset_path/large8-data.bin
#
#
#make clean >/dev/null
#make  SAMPLES_IN_MRAM=1 HDC_MAX_INPUT=1900 NR_DPUS=1024 NR_TASKLETS=18 SHOW_DPU_LOGS=0 >/dev/null
#sudo ./pim_hdc -i $dataset_path/large32-data.bin





