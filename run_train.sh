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
NUM_EPOCHS=9.0
BATCH_SIZE=16
PHRASE_VOCAB_SIZE=20000
MAX_INPUT_EXAMPLES=1000000
SAVE_CHECKPOINT_STEPS=500

echo "preprocess_main counterfactual_unsupervised.json_generated.tsv"
### 3. Model Training
echo "Model Training run_lasertagger"
NUM_TRAIN_EXAMPLES=$(cat "${OUTPUT_DIR}/train.tf_record.num_examples.txt")
NUM_EVAL_EXAMPLES=$(cat "${OUTPUT_DIR}/validation.tf_record.num_examples.txt")
CONFIG_FILE=./configs/lasertagger_config.json

CUDA_VISIBLE_DEVICES=0 python run_lasertagger.py \
  --training_file=${OUTPUT_DIR}/train.tf_record \
  --label_map_file=${OUTPUT_DIR}/label_map.txt \
  --model_config_file=${CONFIG_FILE} \
  --output_dir=${OUTPUT_DIR}/models/${EXPERIMENT} \
  --init_checkpoint=${BERT_BASE_DIR}/bert_model.ckpt \
  --do_train=true \
  --train_batch_size=${BATCH_SIZE} \
  --save_checkpoints_steps=${SAVE_CHECKPOINT_STEPS} \
  --num_train_epochs=${NUM_EPOCHS} \
  --num_train_examples=${NUM_TRAIN_EXAMPLES} \
  --num_eval_examples=${NUM_EVAL_EXAMPLES}
