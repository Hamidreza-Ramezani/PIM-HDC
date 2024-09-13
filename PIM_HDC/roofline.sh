#! /usr/sh

dataset_path="/data/hamid/hdc-dataset"

data1="${dataset_path}/dickens"
data2="${dataset_path}/mozilla"
data3="${dataset_path}/nci"
data4="${dataset_path}/sao"
data5="${dataset_path}/spamfil"
data6="${dataset_path}/xml"

size1=8
size2=16
size3=32
size4=64
size5=128
size6=256
size7=512
size8=1024



application="$HOME/pim-hdc/PIM_HDC/pim_hdc"
results_dir="$HOME/hdc-roofline-results/aug13"


#advisor -collect roofline -stacks -enable-cache-simulation -project-dir "${results_dir}/l${l1}-${distance}-${pairs_count}Pairs"  --app-working-dir=$HOME/WFA/bin -- $HOME/WFA/bin/align_benchmark -i ${data_path1} -a gap-affine-wfa -g "0,3,4,1"
#
#advisor -collect roofline -stacks -enable-cache-simulation -project-dir "${results_dir}/l${l2}-${distance}-${pairs_count}Pairs" --app-working-dir=$HOME/WFA/bin -- $HOME/WFA/bin/align_benchmark -i ${data_path2} -a gap-affine-wfa -g "0,3,4,1"
#
#advisor -collect roofline -stacks -enable-cache-simulation -project-dir "${results_dir}/l${l3}-${distance}-${pairs_count}Pairs" --app-working-dir=$HOME/WFA/bin -- $HOME/WFA/bin/align_benchmark -i ${data_path3} -a gap-affine-wfa -g "0,3,4,1"
#
#advisor -collect roofline -stacks -enable-cache-simulation -project-dir "${results_dir}/l${l4}-${distance}-${pairs_count}Pairs" --app-working-dir=$HOME/WFA/bin -- $HOME/WFA/bin/align_benchmark -i ${data_path4} -a gap-affine-wfa -g "0,3,4,1"
#
#advisor -collect roofline -stacks -enable-cache-simulation -project-dir "${results_dir}/l${l5}-${distance}-${pairs_count}Pairs" --app-working-dir=$HOME/WFA/bin -- $HOME/WFA/bin/align_benchmark -i ${data_path5} -a gap-affine-wfa -g "0,3,4,1"
#
#advisor -collect roofline -stacks -enable-cache-simulation -project-dir "${results_dir}/l${l6}-${distance}-1MPairs" --app-working-dir=$HOME/WFA/bin -- $HOME/WFA/bin/align_benchmark -i ${data_path6} -a gap-affine-wfa-adaptive -g "0,3,4,1"
#
#advisor -collect roofline -stacks -enable-cache-simulation -project-dir "${results_dir}/l${l7}-${distance}-1MPairs" --app-working-dir=$HOME/WFA/bin -- $HOME/WFA/bin/align_benchmark -i ${data_path7} -a gap-affine-wfa-adaptive -g "0,3,4,1"



make clean >/dev/null
make  SAMPLES_IN_MRAM=1 HDC_MAX_INPUT=960 NR_DPUS=512 NR_TASKLETS=18 SHOW_DPU_LOGS=0 >/dev/null
#sudo ./pim_hdc -i $dataset_path/large8-data.bin

path="${dataset_path}/large32-data.bin"
advisor -collect roofline -stacks -enable-cache-simulation -project-dir "${results_dir}/large32-data.bin" --app-working-dir=$HOME/pim-hdc/PIM_HDC/ -- $application -i $path





