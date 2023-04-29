# ONNX Runtime static library builder for Scyclone

Converts an [ONNX](https://onnx.ai) model to ORT format and serializes it to C++ source code, generate custom slimmed ONNX Runtime static libs & xcframework for apple platforms.

## Credits:

This is a fork of [ort-builder](https://github.com/olilarkin/ort-builder) with some Windows build modifications of [libonnxruntime-neuralnote](https://github.com/tiborvass/libonnxruntime-neuralnote)

## Instructions:

1. Checkout ONNX Runtime `$ git clone https://github.com/microsoft/onnxruntime.git` (Tested with onnxruntime v1.14.1)

2. Place your model in the folder named model.onnx

3. Create a [virtual environment](https://packaging.python.org/tutorials/installing-packages/#creating-virtual-environments) `$ python3 -m venv venv`

4. Activate it (Mac) `$ source ./venv/bin/activate` Windows `$ source ./venv/bin/activate`

5. Install dependencies `$ pip install -r requirements.txt`

6. Run `$ ./convert-model-to-ort.sh model.onnx`

7. Build static libraries using one of the `build-xxx.sh` shell scripts
