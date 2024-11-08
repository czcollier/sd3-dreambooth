export MODEL_NAME="stabilityai/stable-diffusion-3.5-medium"
export INSTANCE_DATA_DIR="sd-data/training/instance/mdx/2014_5"
export OUTPUT_DIR="trained-sd3-lora"
export INSTANCE_PROMPT=""
export VALIDATION_PROMPT=""

huggingface-cli login --token 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 

python .venv/bin/accelerate launch diffusers/examples/dreambooth/train_dreambooth_lora_sd3.py \
	--pretrained_model_name_or_path=$MODEL_NAME  \
	--instance_data_dir=$INSTANCE_DATA_DIR \
	--output_dir=$OUTPUT_DIR \
	--mixed_precision="fp16" \
	--instance_prompt="$INSTANCE_PROMPT" \
	--resolution=1024\
	--train_batch_size=1 \
	--gradient_accumulation_steps=4 \
	--learning_rate=4e-4 \
	--lr_scheduler="constant" \
	--lr_warmup_steps=0 \
	--max_train_steps=500 \
	--validation_prompt="$VALIDATION_PROMPT" \
	--validation_epochs=25 \
	--seed="0" \
