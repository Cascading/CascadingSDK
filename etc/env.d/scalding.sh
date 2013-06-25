function scaldingPath(){
    if [ -z "$SCALA_HOME" ]
    then
        echo "for scalding support, please install scala."
    else
        local VERSION_ARRAY=($(scala -version  2>&1)// /)
        local FULL_SCALA_VERSION="${VERSION_ARRAY[4]}"
        local IFS=\\. 
        read -a VERSION_PARTS <<< "${FULL_SCALA_VERSION}"

        local SCALA_VERSION="${VERSION_PARTS[0]}.${VERSION_PARTS[1]}" 
        
        export PATH=$CASCADING_SDK_HOME/thirdparty/binary/scalding-scala-$SCALA_VERSION/scripts:$PATH

    fi
}

scaldingPath
