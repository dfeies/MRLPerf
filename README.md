# MRLPerf

MRLink performance scripts and tools.

To install, run in PowerShell:
```ps
iex (iwr 'https://raw.githubusercontent.com/dfeies/MRLPerf/refs/heads/main/Install.ps1')
```
The script opens explorer in the Downloads folder where the scripts are installed.  
First, if you have an NVidia GPU, run nvsmi.exe from this folder. It's a tool that adds GPU data to the trace using nvidia-smi.  
Right click on MRLTriage.cmd and run as admin.  
Then send the ETL and the LOG file for investigation.
Now you can close nvsmi.exe.  
