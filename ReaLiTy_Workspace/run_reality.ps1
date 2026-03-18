# run_reality.ps1
# Configuration
$IMAGE_NAME = "voodooed/reality-lab:v1"

# Create output folder if it doesn't exist
New-Item -ItemType Directory -Force -Path "./output" | Out-Null

Write-Host "Launching ReaLiTy Framework (Windows)..." -ForegroundColor Cyan

# Run Docker (no --user flag needed on Windows)
docker run -it --rm `
  -v "${PWD}/input:/app/input" `
  -v "${PWD}/output:/app/output" `
  -v "${PWD}/config.yaml:/app/config/config.yaml" `
  $IMAGE_NAME `
  python reality.py `
    --mode transform `
    --config config/config.yaml `
    --picgan_root model/PICGAN `
    --weights weights/weather/kitti_clear2snow.pth.tar_T1 `
    --input /app/input `
    --output /app/output

Write-Host "Done! Check the 'output' folder for results." -ForegroundColor Green