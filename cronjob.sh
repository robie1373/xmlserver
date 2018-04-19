#!/bin/bash

WORKDIR='/Users/robie/code/xmlserver'
SERVER='server.py'
OUTPUTNAME='exceptions.xml' #this must match OUTPUTNAME in server.py
SERVER_RUN_DURATION=30 #seconds
SHAREPOINT_DELAY=3 #seconds to wait for the sharepoint call to complete
# this is probably redundant since the curl call should have to finish
# before control is returned to the script. Belt and suspenders?
USERNAME="user.name@domain.tld"
# You probably want to export the password for this account as an environmental
# variable rather than hardcode it here. How you do that is up to you

echo "Getting data from sharepoint"
SPURL='https://somesharepoint.com/path/of/doom/'

# uncomment this once $SPURL is the actual URL of the sharepoint call.
echo "Skipping the curl for testing. Remember to uncomment it for production."
# curl --ntlm -u $USERNAME:$ENVPASSWORD "$SPURL" -o $WORKDIR/$OUTPUTNAME

sleep $SHAREPOINT_DELAY
echo "Data saved to $WORKDIR/$OUTPUTNAME"
if [ -f $WORKDIR/$OUTPUTNAME ]
  then
    echo "Running server for $SERVER_RUN_DURATION seconds"
    python $WORKDIR/$SERVER &
    PID=$!
    echo "server pid is $PID"
    sleep $SERVER_RUN_DURATION

    kill -1 $PID
    echo "pid $PID has been killed"
else
  echo "Data does not exist"
fi

echo "cleaning up data"
rm $WORKDIR/$OUTPUTNAME
echo "Job Done"
