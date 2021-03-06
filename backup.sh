#!/bin/bash

# this is to be ran from the machine running docker

# make sure to create the backups directory
if [ ! -d backups ]; then
	mkdir backups
fi

echo 'say Backing started...' | sudo socat EXEC:"docker attach mc",pty STDIN
echo 'say Expect some latency.' | sudo socat EXEC:"docker attach mc",pty STDIN
echo 'save-off' | sudo socat EXEC:"docker attach mc",pty STDIN
echo 'save-all' | sudo socat EXEC:"docker attach mc",pty STDIN
tar -czvf backups/`date '+%Y%m%d-%H%M%S'`.tar.gz data
echo 'save-on' | sudo socat EXEC:"docker attach mc",pty STDIN
echo 'say Backup finished.' | sudo socat EXEC:"docker attach mc",pty STDIN

