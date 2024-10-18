#! /usr/sh

dataset_path="/data/hamid/hdc-dataset"
application="$HOME/pim-hdc/PIM_HDC/pim_hdc"
results_dir="$HOME/hdc-roofline-results/sep13"

data1="tiny"
data2="large"
data3="large8"
data4="large32"
data5="large256"

#make clean >/dev/null
#make NR_DPUS=12 NR_TASKLETS=15 SHOW_DPU_LOGS=0 >/dev/null
#advisor -collect roofline -stacks -enable-cache-simulation -project-dir "${results_dir}/${data1}" --app-working-dir=$HOME/pim-hdc/PIM_HDC/ -- $application -i "${dataset_path}/${data1}-data.bin"
#
#make clean >/dev/null
#make NR_DPUS=256 NR_TASKLETS=18 SHOW_DPU_LOGS=0 >/dev/null
#advisor -collect roofline -stacks -enable-cache-simulation -project-dir "${results_dir}/${data2}" --app-working-dir=$HOME/pim-hdc/PIM_HDC/ -- $application -i "${dataset_path}/${data2}-data.bin"
#
#make clean >/dev/null
#make  SAMPLES_IN_MRAM=1 HDC_MAX_INPUT=960 NR_DPUS=512 NR_TASKLETS=18 SHOW_DPU_LOGS=0 >/dev/null
#advisor -collect roofline -stacks -enable-cache-simulation -project-dir "${results_dir}/${data3}" --app-working-dir=$HOME/pim-hdc/PIM_HDC/ -- $application -i "${dataset_path}/${data3}-data.bin"
#
make clean >/dev/null
make  SAMPLES_IN_MRAM=1 HDC_MAX_INPUT=1900 NR_DPUS=1024 NR_TASKLETS=18 SHOW_DPU_LOGS=0 >/dev/null
advisor -collect roofline -stacks -enable-cache-simulation -project-dir "${results_dir}/${data4}" --app-working-dir=$HOME/pim-hdc/PIM_HDC/ -- $application -i "${dataset_path}/${data4}-data.bin"

#make clean >/dev/null
#make  SAMPLES_IN_MRAM=1 HDC_MAX_INPUT=6640 NR_DPUS=2304 NR_TASKLETS=18 SHOW_DPU_LOGS=0 >/dev/null
#advisor -collect roofline -stacks -enable-cache-simulation -project-dir "${results_dir}/${data5}" --app-working-dir=$HOME/pim-hdc/PIM_HDC/ -- $application -i "${dataset_path}/${data5}-data.bin"




