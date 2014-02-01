
[ -z "${CASCADING_SDK_HOME}" ] && echo "CASCADING_SDK_HOME must be set" && return

PATH=@BIN_PATHS@:$PATH

if [ ! -d $HOME/.cascading/.driven-plugin  ]; then
    echo -e "\n-------------------------------------------------------------------------------------"
    echo -e "Get Driven for Cascading by running $CASCADING_SDK_HOME/etc/get-driven.sh"
    echo -e "For more information go to http://cascading.io/"
    echo -e "-------------------------------------------------------------------------------------"
fi

