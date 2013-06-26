# 
#  Copyright (c) 2007-2013 Concurrent, Inc. All Rights Reserved.
# 
#  Project and contact information: http://www.cascading.org/
# 
#  This file is part of the Cascading project.
# 
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
# 
#      http://www.apache.org/licenses/LICENSE-2.0
# 
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
   

# implemented as a function to no pollute the environment
function scaldingPath(){

WANTED_VERSION="2.10"


if [ -z "$SCALA_HOME" ] || [ -z "$(which sbt)" ] 
then
    echo "for scalding support, please install scala ${WANTED_VERSION} and sbt."
else
    local VERSION_ARRAY=($(scala -version  2>&1)// /)
    local FULL_SCALA_VERSION="${VERSION_ARRAY[4]}"
    local IFS=\\. 
    read -a VERSION_PARTS <<< "${FULL_SCALA_VERSION}"

    local SCALA_VERSION="${VERSION_PARTS[0]}.${VERSION_PARTS[1]}" 

    if [ "$SCALA_VERSION" != $WANTED_VERSION ]
    then
        echo "Your scala version $FULL_SCALA_VERSION will not work with scalding. Please install scala $WANTED_VERSION"
        # TODO add PATH magic here, once we know, how
    fi

fi
}

scaldingPath
