#/bin/bash
# Copyright 2011-2014 Concurrent, Inc.

CASCADING_DIR=$HOME/.cascading

DRIVEN_URL="https://driven.cascading.io"

INSTALLER_URL="http://eap.concurrentinc.com/driven/1.0/driven-plugin/install-driven-plugin.sh"

if [ ! -d $CASCADING_DIR ]; then
    mkdir $CASCADING_DIR
fi

echo "installing driven into $CASCADING_DIR/.driven-plugin"
exec bash <(wget -qO- $INSTALLER_URL) --host $DRIVEN_URL --no-screen --user-home $CASCADING_DIR
