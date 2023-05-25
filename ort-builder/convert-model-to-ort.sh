model_name=$1

python -m onnxruntime.tools.convert_onnx_models_to_ort $1 --enable_type_reduction

