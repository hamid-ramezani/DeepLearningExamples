#!/bin/bash


num_gpus=4

if [[ $1 == 'train' ]]; then
    echo 'Run training...'
    python -m torch.distributed.launch --nproc_per_node=$num_gpus train.py \
        --cuda \
        --data ../data/text8/ \
        --dataset text8 \
        --n_layer 12 \
        --d_model 512 \
        --n_head 8 \
        --d_head 64 \
        --d_inner 2048 \
        --dropout 0.1 \
        --dropatt 0.0 \
        --optim adam \
        --lr 0.00025 \
        --warmup_step 0 \
        --max_step 10 \
        --tgt_len 512 \
        --mem_len 512 \
        --eval_tgt_len 128 \
        --batch_size 22 \
        --multi_gpu ddp\
        ${@:2}
elif [[ $1 == 'eval' ]]; then
    echo 'Run evaluation...'
    python -m torch.distributed.launch --nproc_per_node=$num_gpus eval.py \
        --cuda \
        --data ../data/text8/ \
        --dataset text8 \
        --tgt_len 80 \
        --mem_len 2100 \
        --clamp_len 820 \
        --same_length \
        --split test \
        ${@:2}
else
    echo 'unknown argment 1'
fi
