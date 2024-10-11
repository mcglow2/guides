# HPC Storage

The HPC cluster contains a 3PB shared storage system that is available on all the compute nodes.

```{important}
   We will be phasing in charges for storage usage over 10TB. Charges begin July 1, 2026 , for details see the full 
   announcement at [RT Announcements](https://it.tufts.edu/research-technology/announcements) .
```

```{important}
   No restricted data is allowed on Tufts HPC cluster
```

The shared storage system is attached to all compute nodes.  This means that once you copy your data onto the system, it is available in the same location on any node you connect to.  

All users have a home folder at the path `/cluster/home/your_utln` this is where you should store your files.  Some users working with a researcher or lab will also
have access to a project folder, the path to this will be `/cluster/tufts/yourlabname/` .


## Storage Usage Limits aka Quotas

```{hint}
   Utilize [hpctools - Tufts HPC Helper Tool](../examples/hpctools.md) to check storage usage and quota
```
### Home Directory

Be aware! Your Home Directory (**30GB**, fixed) should be `/cluster/home/your_utln`

If you are not sure how much storage you have used in your home directory, feel free to contact us and we can provide you the number. 

Or, you can use **`hpctools`** (login or compute node) OR run

```
$ du -a -h --max-depth=1 ~ | sort -hr
```

from a **compute node** in your home directory to find out the detailed usage. 

### Lab Research Project Storage

Your research project storage (from **50GB and up**) path should be `/cluster/tufts/yourlabname/`, and each member of the lab group has a dedicated directory `/cluster/tufts/yourlabname/your_utln`

To see your **research project storage quota** by running the following command from **any node on the new cluster Pax**:

```
$ df -h /cluster/tufts/yourlabname
```

**NOTE:** Accessing your research project storage space for the __first time__ in your current session, please make sure you type out the __FULL PATH__ to the directory `/cluster/tufts/yourlabname/`.

**Need access to a specific lab research project storage on HPC cluster?** Submit a [Cluster Storage Request]
(https://tufts.qualtrics.com/jfe/form/SV_5bUmpFT0IXeyEfj), the link is also available on [Research Technology website](https://it.tufts.edu/high-performance-computing) 




```{gallery-grid}
:grid-columns: 1
:grid-rows: 16

- header: "{fas}`book;pst-color-primary` HPC Cluster Storage Request"
  content: "Request research storage space or request access to storage space on HPC cluster"
  link: "../other/StorageRequest.html"

- header: "{fas}`book;pst-color-primary` HPC Cluster File Transfers"
  content: "How to transfer files to and from Tufts HPC cluster"
  link: "0040_xfer.html"

- header: "{fas}`book;pst-color-primary` File Recovery Using Snapshots"
  content: "How to recovery recently deleted files on Tufts HPC cluster using snapshots"
  link: "../examples/snapshots.html"

```



