WIKISPLIT_DIR=/home/yuqiang.xyq/my_git_laser/data
# Preprocessed data and models will be stored here.
OUTPUT_DIR=/home/yuqiang.xyq/my_git_laser/output
# Download the pretrained BERT model:
# https://storage.googleapis.com/bert_models/2018_10_18/cased_L-12_H-768_A-12.zip
BERT_BASE_DIR=/data/pretrained_models/cased_L-12_H-768_A-12

### Optional parameters ###

# If you train multiple models on the same data, change this label.
EXPERIMENT=cfg_experiment
# To quickly test that model training works, set the number of epochs to a
# smaller value (e.g. 0.01).
NUM_EPOCHS=3.0
BATCH_SIZE=64
PHRASE_VOCAB_SIZE=20000
MAX_INPUT_EXAMPLES=1000000
SAVE_CHECKPOINT_STEPS=500

echo "preprocess_main counterfactual_unsupervised.json_generated.tsv"
python preprocess_main.py \
    --input_file=${WIKISPLIT_DIR}/counterfactual_unsupervised.json_generated.tsv \
    --input_format=wikisplit \
    --output_tfrecord=${OUTPUT_DIR}/train.tf_record \
    --label_map_file=${OUTPUT_DIR}/label_map.txt \
    --vocab_file=${BERT_BASE_DIR}/vocab.txt \
    --output_arbitrary_targets_for_infeasible_examples=false
