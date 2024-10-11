# GPU

GPUs (Graphics Processing Units) are essential for tasks requiring high parallelism, such as deep learning and simulations.
Tufts HPC cluster offers various types of NVIDIA GPUs in different partitions.

__NVIDIA GPUs__ are available in `gpu` and `preempt` partitions




**Request GPU resources with `--gres`. See details below.**

- Request specific GPU architecture with `--gres=gpu:t4:1`, e.g.

  `$ srun -p preempt -n 2 --mem=4g --gres=gpu:t4:1 -t 1:00:00 --pty bash`

  - `--gres` : Generic Resource
  - `gpu:t4:1` : requesting one T4 GPU.

- If no specific architecture is required, GPU resources can be request with`--gres=gpu:1`, e.g.

  `$ srun -p preempt -n 2 --mem=4g --gres=gpu:1 -t 1:00:00 --pty bash`

  - `--gres` : Generic Resource
  - `gpu:1` : requesting one GPU (any GPU architecture available in the request partition)

- You can request more than one type (but not all) of GPUs with `constraint`, e.g.  

  `$ srun -p preempt -n 2 --mem=4g --gres=gpu:1 --constraint="t4|p100|v100" -t 1:00:00 --pty bash`

  - `--constraint` : set constraints on the resources allocated for the task.
  - `t4|p100|v100` : indicates that the task can use a GPU of type t4, p100, or v100, where the | symbol means "or".

- **DO NOT** manually set `CUDA_VISIBLE_DEVICES`. 

- Users can **ONLY** see GPU devices that are assigned to them by using the `$ nvidia-smi` command.

  If you submit batch jobs, it's recommended adding this command in your slurm job submission script.

### Available GPUs in `gpu` partition`-p gpu`:

- NVIDIA A100
  - In "gpu" partition
  - Request with: `--gres=gpu:a100:1`(one A100 GPU, can request up to 8 on one node)
  - `--constraint="a100-80G"`
  - Each GPU comes with 80GB of DRAM
  - Driver supports upto CUDA 12.2
- NVIDIA P100s
  - In "gpu" partition
  - Request with: `--gres=gpu:p100:1`(one P100 GPU, can request up to 4 on one node)
  - `--constraint="p100"`
  - Each GPU comes with 16GB of DRAM
  - Driver supports upto CUDA 12.2

### Available GPUs in`preempt` partition `-p preempt`:

- NVIDIA T4
  - In "preempt" partition
  - Request with: `--gres=gpu:t4:1`(one T4 GPU, can request up to 4 on one node)
  - `--constraint="t4"`
  - Each GPU comes with 16GB of DRAM
  - Driver supports upto CUDA 10.2
- NVIDIA V100
  - In "preempt" partition
  - Request with: `--gres=gpu:v100:1`(one V100 GPU, can request up to 4 on one node)
  - `--constraint="v100"`
  - Each GPU comes with 16GB of DRAM
  - Driver supports upto CUDA 12.2
- NVIDIA P100
  - In "preempt" partition
  - Request with: `--gres=gpu:p100:1`(one P100 GPU, can request up to 6 on one node)
  - `--constraint="p100"`
  - Each GPU comes with 16GB of DRAM
  - Driver supports upto CUDA 12.2
- NVIDIA rtx_6000
  - In "preempt" partition
  - Request with: `--gres=gpu:rtx_6000:1`(one RTX_6000 GPU, can request up to 8 on one node)
  - `--constraint="rtx_6000"`
  - Each GPU comes with 24GB of DRAM
  - Driver supports upto CUDA 12.2
- NVIDIA rtx_a6000
  - In "preempt" partition
  - Request with: `--gres=gpu:rtx_a6000:1`(one RTX_A6000 GPU, can request up to 8 on one node)
  - `--constraint="rtx_a6000"`
  - Each GPU comes with 48GB of DRAM
  - Driver supports upto CUDA 12.2
- NVIDIA rtx_6000ada
  - In "preempt" partition
  - Request with: `--gres=gpu:rtx_6000ada:1`(one RTX_6000Ada GPU, can request up to 4 on one node)
  - `--constraint="rtx_6000ada"`
  - Each GPU comes with 48GB of DRAM
  - Driver supports upto CUDA 12.2
- NVIDIA L40s
  - In "preempt" partition
  - Request with: `--gres=gpu:l40s:1`(one L40s GPU, can request up to 4 on one node)
  - `--constraint="l40s"`
  - Each GPU comes with 48GB of DRAM
  - Driver supports upto CUDA 12.2
- NVIDIA rtx_a5000
  - In "preempt" partition
  - Request with: `--gres=gpu:rtx_a5000:1`(one RTX_A5000 GPU, can request up to 8 on one node)
  - `--constraint="rtx_a5000"`
  - Each GPU comes with 24GB of DRAM
  - Driver supports upto CUDA 12.2
- NVIDIA A100
  - In "preempt" partition
  - Request with: `--gres=gpu:a100:1`(one A100 GPU, can request up to 8 on one node)
  - `--constraint="a100-80G"`
  - `--constraint="a100-40G"`
  - `--constraint="a100"`
  - Each GPU comes with 40GB of DRAM or 80GB of DRAM
  - Driver supports upto CUDA 12.2
- NVIDIA H100
  - In "preempt" partition
  - Request with: `--gres=gpu:h100:1`(one H100 GPU, can request up to 3 on one node)
  - `--constraint="h100"`
  - Each GPU comes with 80GB of DRAM
  - Driver supports upto CUDA 12.2

