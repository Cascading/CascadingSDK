
[ -z "${CASCADING_SDK_HOME}" ] && echo "CASCADING_SDK_HOME must be set" && return

PATH=@BIN_PATHS@:$PATH

for en in $CASCADING_SDK_HOME/etc/env.d/*.sh ; do . $en ; done
unset en
