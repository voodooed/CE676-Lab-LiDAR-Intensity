# Configuration

$IMAGE_NAME = "voodooed/reality-lab:v1"



# Create output folder if it doesn't exist

if (-not (Test-Path -Path "./output")) {

    New-Item -ItemType Directory -Path "./output"

}



Write-Host "🚀 Launching ReaLiTy Framework (Windows)..." -ForegroundColor Cyan



# Run Docker

docker run -it --rm `

  -v "${PWD}/input:/app/input" `

  -v "${PWD}/output:/app/output" `

  -v "${PWD}/config.yaml:/app/config/config.yaml" `

  $IMAGE_NAME `

  python reality.py --mode transform --input /app/input --output /app/output --config config/config.yaml --picgan_root model/PICGAN --weights weights/weather/kitti_clear2snow.pth.tar_T1



Write-Host "Done! Check the 'output' folder for results." -ForegroundColor Green
