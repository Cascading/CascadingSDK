
[ -z "${CASCADING_SDK_HOME}" ] && echo "CASCADING_SDK_HOME must be set" && return

PATH=${CASCADING_SDK_HOME}/tools/multitool-20131119/bin:${CASCADING_SDK_HOME}/tools/load-20131119/bin:${CASCADING_SDK_HOME}/tools/lingual-client/bin:$PATH

if [ ! -d $HOME/.cascading/.driven-plugin  ]; then
    echo -e "\n-------------------------------------------------------------------------------------"
    echo -e "Get Driven for Cascading by running $CASCADING_SDK_HOME/etc/get-driven.sh"
    echo -e "For more information go to http://cascading.io/"
    echo -e "-------------------------------------------------------------------------------------"
fi

