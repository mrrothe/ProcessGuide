# Process Guide
## A tool for generating HTML process walkthrough guides using Microsoft Excel

![Overview Screenshot](https://rothe.uk/static/processguide/overview.png "Process Guide Overview")

Process Guide comprises 2 parts:
1. An excel/VBA based system for generating/updating processes
2. An HTML/JS based system for using the processes

Downloading and executing a macro-enabled excel file from the internet clearly has some security implications, I've added the VB script that's executed by excel in a seperate vbs file. You will need to call the ExportAll subrouting manually if you use this as the small window with a handy export button won't be included

Use of the process system:
+ Open the index.html file in your chosen browser

Use of process generator/updater:
+ Open processguide.xlsm
+ Enable macros
+ Duplicate the template tab for each new process
+ Fill sequential numbers down the number field (these aren't parsed, just used for human identification of questions) 
+ Enter a question/step followed by definitions for each button (you can define 0,1,2 buttons as required)
+ Once all steps have been completed, click the "Export process" button in the floating dialog

![Edit Screenshot](https://rothe.uk/static/processguide/edit.png "Process Guide Editing")