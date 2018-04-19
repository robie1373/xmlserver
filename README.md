# xmlserver

Serves a single xml file using python simplehttpserver.
Bundled cron script designed to start it, run it for some time and then kill and clean up.

## Notes
You could run a copy of the service on multiple ports by changing port # and the outputname in these files.

## cronjob.sh
Set the following variables

WORKDIR='/the/path/to/your/workingdir' No trailing slash
SERVER='server.py'
OUTPUTNAME='exceptions.xml' #this must match OUTPUTNAME in server.py
SERVER_RUN_DURATION=30 #seconds
SHAREPOINT_DELAY=3 #seconds to wait for the sharepoint call to complete
 this is probably redundant since the curl call should have to finish
 before control is returned to the script. Belt and suspenders?

## server.py

Set the following variables

port_number = 8009
outputname = "exceptions.xml"
