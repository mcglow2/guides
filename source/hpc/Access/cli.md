# Command Line Interface (CLI) via SSH

### Prerequisites

Active Cluster Account

VPN

- Off-campus Non-Tufts Network please connect to [Tufts VPN](https://access.tufts.edu/vpn)

2FA

- DUO is needed on Tufts Network (not needed for [**OnDemand**](https://ondemand.pax.tufts.edu), https://ondemand.pax.tufts.edu)

- DUO is needed when using FastX11 from  [__OnDemand__](https://ondemand.pax.tufts.edu)

SSH

- The SSH protocol aka **Secure Shell** is a method for secure remote login from one computer to another. 

X Window System (X11)

- The X Window System (X11) is an open source, cross platform,  client-server computer software system that provides a **GUI** in a  distributed network environment.

Login Hostname

- login.cluster.tufts.edu = login.pax.tufts.edu

### Mac OSX & Linux  

- Command for Shell environment (default: bash):

  - `$ ssh your_utln@login.cluster.tufts.edu` 

- Command with GUI:
  X Window system needs to be installed on your local computer.
  - `$ ssh -XC your_utln@login.cluster.tufts.edu`
    or
  - `$ ssh -YC your_utln@login.cluster.tufts.edu`

- Explanation of the Command:
  - `ssh`: The command to initiate an SSH connection.The SSH protocol aka **Secure Shell** is a method for secure remote login from one computer to another.
  - `-X` or `-Y`: These options enable X11 forwarding. -X is more secure, while -Y is more permissive and might be needed for some applications that don't work well with -X.
  - `-C`: This option enables compression, which can speed up the transfer of data over the network.
  - `your_utln@login.cluster.tufts.edu`: Replace your_utln with your actual Tufts username. This is the address of the remote HPC cluster.

- What Happens After Running the Command for Login:
  - You will be prompted to enter your password.
  - You will complete the 2FA process if required.


Now you are on a **Login Node** of the cluster (login-prod-0x) and in your **Home Directory** (~ or */cluster/home/your_utln*). 

`$ [your_utln@login-prod-02 ~]`

There are 3 login nodes: `login-prod-01`, `login-prod-02`, `login-prod-03` 

***Please DO NOT run any software on the login nodes.***

- Setting up [SSH keyless access](_https://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/_) 

  * Be sure your `~/.ssh` permission is correct! Otherwise, SSH won't work properly.

  * `. ssh` directory: 700 ( drwx------ )

  * public key ( `. pub` file): 644 ( -rw-r--r-- )

  * private key (` id_rsa` ): 600 ( -rw------- )

### Windows

- **[PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/learn/remoting/ssh-remoting-in-powershell-core?view=powershell-7.2)**
- **[WSL - Windows Subsystem for linux](https://learn.microsoft.com/en-us/windows/wsl/install)**
- **[PuTTY](https://www.putty.org/)**  
- **[Cygwin](https://www.cygwin.com/)** 

**Hostname**: `login.cluster.tufts.edu` or `login.pax.tufts.edu`

***Please DO NOT run any software on the login nodes.***

