module unload nccl
export BITS=8
source run_wt103_base.sh train 8

export BITS=7
source run_wt103_base.sh train 8

export BITS=6
source run_wt103_base.sh train 8

export BITS=5
source run_wt103_base.sh train 8

export BITS=4
source run_wt103_base.sh train 8


module load nccl
source run_wt103_base.sh train 8



