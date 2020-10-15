# ---------------- Train Normal BERT -------------------- #

train_bert:
	python run_bert.py \
	--train_file datas/squad/${TRAIN_FILE} \
	--predict_file datas/squad/SQuAD-v1.1-dev.json \
	--model_type bert \
	--model_name_or_path bert-base-uncased \
	--do_lower_case \
	--dev_pkl datas/squad/valid_1st.p \
	--per_gpu_train_batch_size 12 \
	--per_gpu_eval_batch_size 12 \
	--do_train \
	--bias_eval True \
	--output_dir ${OUTPUT_DIR}

# ---------------- Train Baseline BERT -------------------- #

# 1. Entropy Regularization
train_entropy_bert:
	python run_bert.py \
	--train_file datas/squad/${TRAIN_FILE} \
	--predict_file datas/squad/SQuAD-v1.1-dev.json \
	--model_type bert_reg \
	--model_name_or_path bert-base-uncased \
	--do_lower_case \
	--dev_pkl datas/squad/valid_1st.p \
	--per_gpu_train_batch_size 12 \
	--per_gpu_eval_batch_size 12 \
	--do_train \
	--bias_eval True \
	--output_dir ${OUTPUT_DIR}

# 2. Randomized Position
train_random_bert:
	python run_bert.py \
	--train_file datas/squad/${TRAIN_FILE} \
	--predict_file datas/squad/SQuAD-v1.1-dev.json \
	--model_type bert_random \
	--model_name_or_path bert-base-uncased \
	--do_lower_case \
	--dev_pkl datas/squad/valid_1st.p \
	--per_gpu_train_batch_size 12 \
	--per_gpu_eval_batch_size 12 \
	--do_train \
	--bias_eval True \
	--output_dir ${OUTPUT_DIR}


# ---------------- Train Ensemble BERT -------------------- #

# 1. Bias Product
train_prod_bert:
	python run_bert.py \
	--train_file datas/squad/${TRAIN_FILE} \
	--predict_file datas/squad/SQuAD-v1.1-dev.json \
	--boundary_path datas/squad/train_sent_boundary.p \
	--answer_stat_path datas/squad/${STAT_FILE} \
	--model_type bert_prod \
	--model_name_or_path bert-base-uncased \
	--do_lower_case \
	--dev_pkl datas/squad/valid_1st.p \
	--per_gpu_train_batch_size 12 \
	--per_gpu_eval_batch_size 12 \
	--do_train \
	--bias_eval True \
	--all_bound True \
	--output_dir ${OUTPUT_DIR}

# 2. Learned-Mixin
train_mixin_bert:
	python run_bert.py \
	--train_file datas/squad/${TRAIN_FILE} \
	--predict_file datas/squad/SQuAD-v1.1-dev.json \
	--boundary_path datas/squad/train_sent_boundary.p \
	--answer_stat_path datas/squad/i${STAT_FILE} \
	--model_type bert_mixin \
	--model_name_or_path bert-base-uncased \
	--do_lower_case \
	--dev_pkl datas/squad/valid_1st.p \
	--per_gpu_train_batch_size 12 \
	--per_gpu_eval_batch_size 12 \
	--do_train \
	--bias_eval True \
	--all_bound True \
	--output_dir ${OUTPUT_DIR}

