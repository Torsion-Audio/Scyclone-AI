#!/bin/bash

model_name=$1

python -m onnxruntime.tools.convert_onnx_models_to_ort $1 --enable_type_reduction

#rm -R ./model/
#mkdir -p ./model

#python -m bin2c -o ./model/$1.ort $1.ort
