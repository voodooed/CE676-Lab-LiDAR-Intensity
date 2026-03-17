# CE676-Lab-LiDAR-Intensity
### Exploring the Effect of Weather on LiDAR Intensity using ReaLiTy Framework
## ReaLiTy Framework: Physics-Informed Learning-Based LiDAR Simulation

This repository provides the workspace and scripts to run the **ReaLiTy** framework. The core environment is hosted on Docker Hub to ensure a seamless, "no-install" setup.

---

## 1. Fast Setup (Prerequisites)

1. **Install Docker:** [Docker Desktop](https://www.docker.com/products/docker-desktop/) (Windows/Mac) or `sudo apt install docker.io` (Linux).
2. **Clone this Repo:**
```bash
   git clone https://github.com/yourusername/CE676-Lab-LiDAR-Intensity.git
   cd ReaLiTy-Workspace
```

---

## 2. Running the Sample

We have included sample data in the `input/` folder. To run the transformation immediately:

**🐧 Linux / 🍎 macOS**
```bash
chmod +x run_reality.sh
./run_reality.sh
```

**🪟 Windows (PowerShell)**
```powershell
# You may need to enable script execution once:
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
./run_reality.ps1
```

---

## 3. Using Your Own Data

1. Replace the files in the `input/` folder with your own KITTI-format `.bin` files.
2. Edit `config.yaml` to change weather parameters (`snow`, `rain`, `precipitation_rate`).
3. Run the script again. Results will appear in the `output/` folder.

## Pipeline Execution Overview

The script performs the following actions:

1. Pulls the latest `reality-lab` image from Docker Hub.
2. Mounts your local `/input`, `/output`, and `config.yaml` into the isolated container.
3. Executes the PICGAN transformation.
4. Exports the generated LiDAR frames back to your local `/output` folder.
