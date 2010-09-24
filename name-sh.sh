#! /bin/bash

name="$@"
echo "Changing name to $name"
dcop "$KONSOLE_DCOP_SESSION" renameSession "$name"
