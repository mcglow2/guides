# File Transfer to/from Tufts HPC Cluster

### Prerequisites

Active Cluster Account

VPN

- Off-campus Non-Tufts Network please connect to [Tufts VPN](https://access.tufts.edu/vpn)

2FA

- DUO is needed on Tufts Network (not needed for [**OnDemand**](https://ondemand.pax.tufts.edu), https://ondemand.pax.tufts.edu)

- DUO is needed when using FastX11 from  [__OnDemand__](https://ondemand.pax.tufts.edu)

- This guide provides clear instructions on how to transfer files to and from the Tufts HPC cluster using various tools and protocols.

- File Transfer Hostname

  - xfer.cluster.tufts.edu = xfer.pax.tufts.edu

- File Transfer Protocol

  - SCP(Secure Copy Protocol)
  - SFTP(SSH File Transfer Protocol)
  - rsync over SSH

- Recommended Tools

  > - Windows Only: **[WinSCP](https://winscp.net/eng/index.php)**
  > - Cross-Platform: **[FileZilla](https://filezilla-project.org/)**    
  > - Cross-Platform: **[Cyberduck](https://cyberduck.io/)**
  > - Web Interface:**[OnDemand](https://ondemand.pax.tufts.edu)** (Only for transfering files size **less than 976MB per file.**)

### OnDemand

- Go to OnDemand:

  **[https://ondemand.pax.tufts.edu/]( https://ondemand.pax.tufts.edu/)** 

- Under **`Files`**, using the **`Upload`** or **`Download`** buttons to transfer. Make sure you navigate to the destination/source directory on cluster using the **`Go To`** button before transfering files.

  <img src="https://raw.githubusercontent.com/DelilahYM/ImageHost/master/ondemand_homedir.png" alt="Core-Node" width=70%>

  You may not see your lab folder listed under `/cluster/tufts`, **DO** use `Go To` buttom and **TYPE** out the **FULL** path. 


### Command Line - scp & rsync

> Hostname** for file transfer: xfer.cluster.tufts.edu
>
> NOTE:
>
> * __Local_Path__ : Path to your files or directory on your local computer
> * __Cluster_Path__ :Path to your files or directory on the cluster
>   * Home Directory: */cluster/home/your_utln/your_folder*
>   * Research Project Storage Space Directory: */cluster/tufts/yourlabname/your_utln/your_folder*

***Execute from your local machine terminal.* **

General Format:

`$ scp From_Path To_Path`

`$ rsync From_Path To_Pat`

***NOTE: If you are transfering very large files that could take hours to finish, we would suggest using `rsync` as it has ability to restart from where it left if interrupted.***

Exmaple:

**File** Transfer with `scp`or `rsync`:

* Download from cluster

`$ scp your_utln@xfer.cluster.tufts.edu:Cluster_Path Local_Path  `

`$ rsync your_utln@xfer.cluster.tufts.edu:Cluster_Path Local_Path`

* Upload to cluster

`$ scp Local_Path your_utln@xfer.cluster.tufts.edu:Cluster_Path`

`$ rsync Local_Path your_utln@xfer.cluster.tufts.edu:Cluster_Path`

**Directory** Transfer with `scp` or `rsync`:

* Download from cluster

`$ scp -r your_utln@xfer.cluster.tufts.edu:Cluster_Path Local_Path  `

`$ rsync -azP your_utln@xfer.cluster.tufts.edu:Cluster_Path Local_Path`

* Upload to cluster

`$ scp -r Local_Path your_utln@xfer.cluster.tufts.edu:Cluster_Path`

`$ rsync -azP Local_Path your_utln@xfer.cluster.tufts.edu:Cluster_Path`

