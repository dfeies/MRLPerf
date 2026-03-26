# MRLPerf

MRLink performance scripts and tools.

## Instructions

- Go to https://github.com/dfeies/MRLPerf/releases
- Download the latest `MRLPerf.zip` and extract it to a folder of your choice.
- **FIRST RUN**: run `nvsmi.exe` manually to allow Windows Defender to trust it. It's a tool used to get GPU data for the trace.
- Right click `MRLTriage.cmd` or `MRLTriage_Lite.cmd`, click `Run as administrator` and follow the instructions in the command prompt.
- Keep the repro duration as short as possible to avoid generating very large ETL files.
- Send the generated ETL files (*.etl and *.etl.00n) for analysis.
- Then you can close the nvsmi.exe app, it's only used to get GPU data for the trace.
