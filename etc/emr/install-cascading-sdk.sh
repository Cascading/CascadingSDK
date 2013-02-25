#!/bin/bash
set -e -x

# Usage:
#  --user-home - an alternative user to install into, default /home/hadoop
#  --tmpdir - an alternative temporary directory, default TMPDIR or /tmp if not set
#  --no-screen - do not install screen, screen is installed by default on the master as a convenience
#  --latest - url to text file referencing the latest version
#  --no-bash - do not update .bashrc

LATEST=http://files.cascading.org/sdk/2.1/latest.txt

case "`uname`" in
  Darwin)
    USER_HOME=/Users/$USER;;
  *)
    USER_HOME=/home/$USER;;
esac

INSTALL_ON_SLAVES=false
BASH_PROFILE=.bashrc
INSTALL_SCREEN=y
UPDATE_BASH=y

IS_MASTER=true
if [ -f /mnt/var/lib/info/instance.json ]
then
  IS_MASTER=`cat /mnt/var/lib/info/instance.json | tr -d '\n ' | sed -n 's|.*\"isMaster\":\([^,]*\).*|\1|p'`
  USER_HOME=/home/hadoop
fi

[ -n $TMPDIR ] && TMPDIR=/tmp

error_msg () # msg
{
  echo 1>&2 "Error: $1"
}

error_exit () # <msg> <cod>
{
  error_msg "$1"
  exit ${2:-1}
}

while [ $# -gt 0 ]
do
  case "$1" in
    --latest)
      shift
      LATEST=$1
      ;;
    --user-home)
      shift
      USER_HOME=$1
      ;;
    --tmpdir)
      shift
      TMPDIR=$1
      ;;
    --no-screen)
      INSTALL_SCREEN=
      ;;
    --no-bash)
      UPDATE_BASH=
      ;;
    --slaves)
      INSTALL_ON_SLAVES=true
      ;;
    -*)
      # do not exit out, just note failure
      error_msg "unrecognized option: $1"
      ;;
    *)
      break;
      ;;
  esac
  shift
done

if [ "$IS_MASTER" = "false" && "$INSTALL_ON_SLAVES" = "false" ]; then
  exit 0
fi

SDK_HOME=$USER_HOME/Cascading-2.1-SDK

[ -d $SDK_HOME ] && UPDATE_BASH=

# fetch latest SDK
wget -S -T 10 -t 5 -i $LATEST -P $TMPDIR

ARCHIVE=`find $TMPDIR -name 'Cascading-*.tgz'`

# unpack into /home/hadoop/
TMPFILE=`mktemp -d -t sdk.XXXXX`
[ -d $SDK_HOME ] && mv $SDK_HOME $TMPFILE
tar -xzf $ARCHIVE -C $USER_HOME
mv `find $USER_HOME -name 'Cascading-2.1-SDK-*' -type d` $SDK_HOME

if [ -n "$UPDATE_BASH" ]; then
cat >> $USER_HOME/$BASH_PROFILE <<- EOF

# Cascading 2.1 SDK - Concurrent, Inc.
# http://www.concurrentinc.com/

export CASCADING_SDK_HOME=$SDK_HOME

# add tools to PATH
source $SDK_HOME/etc/setenv.sh
EOF
fi

if [ "$IS_MASTER" = "true" ]; then
  [ -n "$INSTALL_SCREEN" ] && sudo apt-get --force-yes install screen -y
fi