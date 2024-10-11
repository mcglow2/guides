# Slurm Job Scheduler

The HPC cluster uses the Slurm Job Scheduler to assign users jobs to compute nodes.  Jobs are allocated based on the 
requested resources and the submitting users priority.  We use the FairShare algorithm which adjusts priority to 
balance usage across of our users.

```{gallery-grid}
:grid-columns: 1
:grid-rows: 16

- header: "{fas}`book;pst-color-primary` Interactive Sessions"
  content: "How to run interactive jobs with cluster resources"
  link: "interactive.html"

- header: "{fas}`book;pst-color-primary` Batch jobs"
  content: "How to submit batch jobs to the cluster and sample slurm batch job scripts"
  link: "batchjob.html"

- header: "{fas}`book;pst-color-primary` Job Monitoring and Management Commands"
  content: "How to monitor and manage your active jobs"
  link: "monitor.html"

- header: "{fas}`book;pst-color-primary` Job Resource Utilization"
  content: "How to check resource utilization of completed jobs: how much memory did the completed job used? how many cores did the completed job utilized?"
  link: "utilization.html"


```


