# Terminology

### What is "Cluster"

-   A computer cluster is a set of loosely or tightly **connected** **computers** **(Nodes)** that work together so that, in many respects, they can be viewed as a single system. Computer clusters have each computing unit set to perform the same/similar tasks, controlled and scheduled by [**software**](#SLURM).

### Cores vs Node

- A **node** is a single computer in the system, which has a number of computing units, **cores**. 

  <img src="https://raw.githubusercontent.com/DelilahYM/ImageHost/master/CoreNode.png" alt="Core-Node" width=70%>

- Number of CPU cores must be specified when running programs on Tufts HPC cluster. 

- In the case one job requires multiple CPU cores, it's recommended to specify if user desire all the required CPU cores to be allocated on a single node or multiple nodes. 

- Not all programs can utilize CPU cores allocated cross nodes. Please check your program's specifics before submitting jobs.

### CPU and GPU

-   CPU -- **Central Processing Unit**

    -   A CPU can never be fully replaced by a GPU

    -   Can be thought of as the **taskmaster** of the entire system, coordinating a wide range of general-purpose computing tasks

-   GPU -- **Graphics Processing Unit**

    -   GPUs were originally designed to create images for computer graphics and video game consoles

    -   GPGPU [more explanation here?]{style="color: red;"}

    -   Performing a narrower range of more specialized tasks

        <img src="https://raw.githubusercontent.com/DelilahYM/ImageHost/master/CPUGPU.png" alt="CPU-GPU" width="60%"/>

- GPU is like the turbo boost to a car's engine, the CPU. 

  -   A computer can't function without a CPU. 
  -   Not all computers have GPUs.


### Memory and Storage

The central processing unit (CPU) of a computer is what manipulates data by performing computations. In practice, almost all computers use a [storage hierarchy](https://en.wikipedia.org/wiki/Memory_hierarchy), which puts fast but expensive and small storage options close to the CPU and slower but less expensive and larger options further away. Generally the fast volatile technologies (which lose data when off power) are referred to as "memory", while slower persistent technologies are referred to as "storage".

-   Memory
    -   Small, fast, expensive
    -   Used to store information for immediate use
-   Storage
    -   Larger, slower, cheaper
    -   Non-volatile (retaining data when its power is shut off)

<img src="https://raw.githubusercontent.com/DelilahYM/ImageHost/master/MemStorage.png" alt="Memory-Storage" width="60%"/>

### What to Expect on Tufts HPC Cluster?

- Each of the CPU cores on the HPC cluster could be less powerful than the ones on your laptop. The CPU clock speed on Tufts HPC cluster is ranged between 2.1GHz - 3.1 GHz.
- There are a lot more CPU cores on a single node on the cluster than what's available on your local desktop or laptop.
- If you don't have a framework that can utilize multiple GPUs, DO NOT request more than one GPU.
- The more resources (Memory, CPU cores, GPUs) you request, the longer your job might have to wait in the queue.
- Cluster VAST storage is fast, but may not be as fast as your local SSD.

