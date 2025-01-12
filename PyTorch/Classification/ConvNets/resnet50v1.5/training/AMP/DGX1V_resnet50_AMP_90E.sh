#python ./multiproc.py --nproc_per_node 8 ./launch.py --model resnet50 --precision AMP --mode convergence --platform DGX1V /imagenet --epochs 90 --mixup 0.0 --workspace ${1:-./} --raport-file raport.json

export IMAGENET_PATH=/nvmedisk/Datasets/ILSVRC/Data/CLS-LOC
program=/nfs/scistore14/alistgrp/hramezan/DeepLearningExamples/PyTorch/Classification/ConvNets/multiproc.py
launch=/nfs/scistore14/alistgrp/hramezan/DeepLearningExamples/PyTorch/Classification/ConvNets/launch.py

python $program --nproc_per_node 4 $launch --model resnet18 --precision AMP --mode convergence --platform DGX1V $IMAGENET_PATH --mixup 0.0 --workspace log/ --raport-file shut_momentum_200 --epochs 1 --prof 500


mv GPU_* log/





