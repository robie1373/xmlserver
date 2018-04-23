# xmlserver

Serves a single xml file using python simplehttpserver.
Bundled cron script designed to start it, run it for some time and then kill and clean up.

## Notes
You could run a copy of the service on multiple ports by changing port # and the outputname in these files.

# Requirements
This requires xmljson. It can be installed with pip install xmljson.

## cronjob.sh
Set the following variables

* WORKDIR='/the/path/to/your/workingdir' No trailing slash
* SERVER='server.py'
* OUTPUTNAME='exceptions.xml' _this must match OUTPUTNAME in server.py_
* SERVER_RUN_DURATION=30 #seconds
* SHAREPOINT_DELAY=3 _seconds to wait for the sharepoint call to complete
 this is probably redundant since the curl call should have to finish
 before control is returned to the script. Belt and suspenders?_
* USERNAME="user.name@domain.tld"
  _You probably want to export the password for this account as an environmental
  variable rather than hardcode it here. How you do that is up to you_

## server.py

Set the following variables

* port_number = 8009
* outputname = "somefilename.xml"
