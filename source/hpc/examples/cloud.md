# Working with Cloud Services

It is possible to work with cloud services such as AWS or Azure when using HPC compute nodes.  However special considerations need to be made to make sure you keep the compute node running at top performance. 
If you are not careful in how you structure your code and workflow the compute node can be let waiting for responses from the cloud services.

Runtime access to data stored in cloud storage such as AWS S3, Azure Blobs or other services you access via http connections is discouraged.  The requests will cause your software to be data bound while waiting for resposnes.
Instead it is best to use a script or program to predownload any data from these services and store it locally on the HPC filesystem where your software can then read it at much higher speeds.

## Clients

### AWS CLI

###AWS Boto

###Azure CLI

###Box CLI?

