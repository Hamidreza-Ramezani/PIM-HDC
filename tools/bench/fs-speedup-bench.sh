#!/bin/sh

set -e

# Generate a CSV file of runs based on:
#     MIN_DPU MAX_DPU MIN_TASKLET MAX_TASKLET [ DPU_INTERVAL ]
#
# eg:
#     ./bench.sh -i large-data.bin 32 64 1 5 2

dpu_interval=1
dpu_only=0
min_dpu=""
max_dpu=""
min_tasklet=""
max_tasklet=""
input=""
host_done=0

export SHOW_DPU_LOGS=0

bench() {
    for d in $(seq "${min_dpu}" "${dpu_interval}" "${max_dpu}"); do
        export NR_DPUS="${d}"
        for t in $(seq "${min_tasklet}" "${max_tasklet}"); do
            export NR_TASKLETS="${t}"

            make clean >/dev/null && make >/dev/null
            if [ "${host_done}" -eq 1 ]; then
                out="$(./pim_hdc -d -i "${input}" -r)"
                host_runtime="0"
            else
                out="$(./pim_hdc -d -i "${input}" -t -r)"
                host_runtime="$(echo "${out}" | sed -n 2p)"
                printf "%s,%s,%s,%s,%s\n" "0" "${host_runtime}" "${sz}" "${t}" "${d}"
                host_done=1
            fi
            dpu_runtime="$(echo "${out}" | sed -n 1p | cut -d',' -f1)"

            printf "%s,%s,%s,%s,%s\n" "1" "${dpu_runtime}" "${sz}" "${t}" "${d}"
        done
    done
}

usage() {
    printf "%s %s\n\t%s\n\t%s\n\t%s\n" "USAGE:" "${0}" \
        "-i INPUT" \
        "-d - Run dpu only" \
        "MIN_DPU MAX_DPU MIN_TASKLET MAX_TASKLET [ DPU_INTERVAL ]"
    exit "${1}"
}

options='hdi:'
while getopts $options option; do
    case $option in
        h  ) usage 0;;
        i  ) input="${OPTARG}";;
        d  ) dpu_only=1;;
        \? ) echo "Unknown option: -${OPTARG}" >&2; usage 1;;
        :  ) echo "Missing option argument for -${OPTARG}" >&2; usage 1;;
        *  ) echo "Unimplemented option: -${OPTARG}" >&2; usage 1;;
    esac
done

shift $((OPTIND - 1))

if [ -z "${1}" ] || [ -z "${2}" ] || [ -z "${1}" ] || [ -z "${2}" ] || [ -z "${input}" ]; then
    usage 1
fi

if [ -n "${5}" ]; then
    dpu_interval="${5}"
fi

min_dpu="${1}"
max_dpu="${2}"
min_tasklet="${3}"
max_tasklet="${4}"

sz=$(du -b "${input}" | cut -f1)

bench
