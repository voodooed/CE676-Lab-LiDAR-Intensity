#!/bin/bash

# 1. Configuration - Replace with your actual Docker Hub username
IMAGE_NAME="voodooed/reality-lab:v1"

# 2. Create output folder if it doesn't exist (Linux style)
mkdir -p ./output

echo "Launching ReaLiTy Framework (Linux/Ubuntu)..."

# 3. Run Docker
# --user $(id -u):$(id -g) prevents the "Locked Folder" issue
sudo docker run -it --rm \
  --user $(id -u):$(id -g) \
  -v "$(pwd)/input:/app/input" \
  -v "$(pwd)/output:/app/output" \
  -v "$(pwd)/config.yaml:/app/config/config.yaml" \
  $IMAGE_NAME \
  python reality.py \
    --mode transform \
    --config config/config.yaml \
    --picgan_root model/PICGAN \
    --weights weights/weather/kitti_clear2snow.pth.tar_T1 \
    --input /app/input \
    --output /app/output

echo "Done! Check the 'output' folder for results."
