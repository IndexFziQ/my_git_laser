WIKISPLIT_DIR=/home/yuqiang.xyq/my_git_laser/data
# Preprocessed data and models will be stored here.
OUTPUT_DIR=/home/yuqiang.xyq/my_git_laser/output
# Download the pretrained BERT model:
# https://storage.googleapis.com/bert_models/2018_10_18/cased_L-12_H-768_A-12.zip
BERT_BASE_DIR=/data/pretrained_models/cased_L-12_H-768_A-12

### Optional parameters ###

# If you train multiple models on the same data, change this label.
EXPERIMENT=cfg_experiment
python phrase_vocabulary_optimization.py \
  --input_file=${WIKISPLIT_DIR}/counterfactual_unsupervised.json_generated.tsv \
  --input_format=wikisplit \
  --vocabulary_size=20000 \
  --max_input_examples=1000000 \
  --output_file=${OUTPUT_DIR}/label_map.txt
