# Tufts HPC Cluster Storage Usage and Quota

### Policy

Please visit [RT Announcements](https://it.tufts.edu/research-technology/announcements) for storage policy updates.

No restricted data allowed on Tufts HPC cluster

**Easy way**: Utilize [hpctools - Tufts HPC Helper Tool](../Compute/hpctools.md) to check storage usage and quota

### Home Directory

Be aware! Your Home Directory (**30GB**, fixed) should be `/cluster/home/your_utln`

If you are not sure how much storage you have used in your home directory, feel free to contact us and we can provide you the number. 

Or, you can use **`hpctools`** (login or compute node) OR run

```
$ du -a -h --max-depth=1 ~ | sort -hr
```

from a **compute node** in your home directory to find out the detailed usage. 

### Lab Research Project Storage

Your research projet storage (from **50GB and up**) path should be `/cluster/tufts/yourlabname/`, and each member of the lab group has a dedicated directory `/cluster/tufts/yourlabname/your_utln`

To see your **research project storage quota** by running the following command from **any node on the new cluster Pax**:

```
$ df -h /cluster/tufts/yourlabname
```

**NOTE:** Accessing your research project storage space for the __first time__ in your current session, please make sure you type out the __FULL PATH__ to the directory `/cluster/tufts/yourlabname/`.

**Need access to a specific lab research project storage on HPC cluster?** Submit a [Cluster Storage Request](https://tufts.qualtrics.com/jfe/form/SV_5bUmpFT0IXeyEfj), the link is also availabe on [Research Technology website](https://it.tufts.edu/high-performance-computing) 

