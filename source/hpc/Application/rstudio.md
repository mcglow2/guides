# RStudio from OnDemand

> Yucheng will have new documentation to replace this one

### Launch RStudio

1. Go to [OnDemand](https://ondemand.cluster.tufts.edu) Login with your username and password
2. Go to `Interactive Apps` tab and select `RStudio Pax`
3. Select the time, number of cores, CPU memory you need, as well as the version of R you wish to run. 
4. Load the module you need for your packages to run, if no additional modules are needed, leave it blank.
5. Each user can only start one OnDemand RStudio session on one compute node at a time. If you need to start multiple RStudio sessions, please make sure you select a different nodename from your current running session. 
6. Click "Launch" and wait for available resources
7. Once it's ready, click on the `Connect to RStudio` button
8. When you finished, exit RStudio properly `q()`, then close the RStudio tab, and go back to the main page click `Delete` to end the session

### Debug OnDemand RStudio Pax

Logs from RStudio could be crupted sometimes which will cause RStudio not launching from OnDemand. Here are a few things you can try. Make sure all RStudio sessions are deleted before this.

- Rename the file `/cluster/home/$USER/.local/share/rstudio`

  $ `mv /cluster/home/$USER/.local/share/rstudio /cluster/home/$USER/.local/share/rstudio_bkp`

- Rename the `/cluster/home/$USER/.RData` 

  $ `mv /cluster/home/$USER/.RData /cluster/home/$USER/.RData_bkp`

Now you can try relaunch RStudio. If it's working properly for you, test out your workflow. 

If you get all you need without issues, you can go ahead and delete `/cluster/home/$USER/.local/share/rstudio_bkp` and `/cluster/home/$USER/.RData_bkp`

If you have any questions or need additional assistance, feel free to reach out to us at tts-research@tufts.edu