# <img style="float: left;" src="assets/logo.png" width="40" /> &nbsp; SCYCLONE | AI

**Scyclone AI** repository is an extension to the main [Scyclone](https://github.com/Torsion-Audio/Scyclone) repository. Scyclone is an audio plugin that utilizes **neural timbre transfer** technology to offer a new approach to audio production. The plugin builds upon [RAVE](https://github.com/acids-ircam/RAVE) methodology, a realtime audio variational auto encoder, facilitating neural timbre transfer in both single and couple inference mode. <br /><br />This repository contains a comprehensive step-by-step instruction that will guide you through the process of creating your own custom sounding presets. You can use both the Colab notebooks or command line to train models.





## Colab

- If you are **new** to machine learning, we encourage you to start with this notebook.
There we have compiled all the instructions to begin creating your custom sounding Scyclone presets.

  [![colab_badge](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/drive/1xKsaGDMWY1NRhP0ndD-iVg89O57GdZdz?usp=sharing) 

- If you hold former AI model training knowledge and want to use a notebook to train a Scyclone preset, start with the notebook below. All parameters and configurations are set to train, export and start using the models inside the plugin. 

  [![colab_badge](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/drive/1DU9KvMdYTOcTT8eYundZ2wruetNDtpX0?usp=sharing) 




## Installation

Scyclone uses RAVE as its timbre tranfer algorithm. To install RAVE, create a new virtual environment, activate it and run:

```bash
pip install acids-rave
```

Install **ffmpeg**:

```bash
conda install ffmpeg
```


## Data Preprocessing
RAVE's original preprocessing code accepts various file extentions. To preprocess your data, run the script:
```bash
rave preprocess --input_path /path/to/audio --output_path /dataset/path --sampling_rate 48000
```


## Training

In our experiments we used **v1** of RAVE with specific configurations, making the model suitable for the plugin's environment. Please note that configurations other than ones mentioned below may lead to an undesirable outcome or cause errors during the export process.

```bash
rave train --config v1 --config centered --db_path /dataset/path --name training_name --override LATENT_SIZE=16 --override CAPACITY=32 
```

## Export onnx

Run this script to export the model after training.

```bash
rave export_onnx --run /path/to/run
```

## ORT Conversion

We now need to convert the ONNX model to ORT (onnxruntime) format, which is essential for a customized and streamlined version of the ONNX Runtime static library to be utilized within Scyclone. This conversion ensures that the model is compatible with the specific requirements of the plugin and it enables an optimal performance of the model.

Assuming you have used a virtual environment for training your model, to avoid potential dependency conflicts and incompatibilities, we reccommend deactivating the previous virtual environment and follow these steps.

1. Checkout ONNX Runtime `$ git clone https://github.com/microsoft/onnxruntime.git` (tested with onnxruntime v1.14.1)

2. Place your model in the folder named model.onnx

3. Create another virtual environment for the conversion

4. Activate it

5. Navigate into the ort-builder directory  

6. Install dependencies `$ pip install -r requirements.txt`

7. Run `$ ./convert-model-to-ort.sh model.onnx`

8. Build static libraries using one of the `build-xxx.sh` shell scripts



## Usage

Once you have the trained model exported, you are ready to use it as a preset inside **Scyclone**. 

- Save the model to your local drive 
- Open the plugin
- Hover over one of the network nodes in order for the network arm to appear. 
- Click on the load model buttton and load the preset.

![interface](assets/load_model.png)
