
[ -z "${CASCADING_SDK_HOME}" ] && echo "CASCADING_SDK_HOME must be set" && return

PATH=@BIN_PATHS@:$PATH

if [ ! -d $HOME/.cascading/.driven-plugin  ]; then
    echo -e "\n-------------------------------------------------------------------------------------"
    echo -e "Get Driven for Cascading by running install-driven-plugin"
    echo -e "For more information read $CASCADING_SDK_HOME/driven/README.md or go to http://cascading.io/"
    echo -e "-------------------------------------------------------------------------------------"
fi
