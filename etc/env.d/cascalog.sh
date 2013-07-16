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
function discoverLein(){

WANTED_VERSION_MAJOR="2"

if [ -z "$(which lein)" ]
then
    echo "for cascalog support, please install leinigen ${WANTED_VERSION} or later."
else
    local VERSION_ARRAY=($(lein -version  2>&1)// /)
    local FULL_LEIN_VERSION="${VERSION_ARRAY[1]}"
    local IFS=\\. 
    read -a VERSION_PARTS <<< "${FULL_LEIN_VERSION}"

    local LEIN_MAJOR_VERSION="${VERSION_PARTS[0]}"

    if [ "$LEIN_MAJOR_VERSION" != "$WANTED_VERSION_MAJOR" ]
    then
        echo -n "Your leinigen version $FULL_LEIN_VERSION will not work with "
        echo -n "cascalog. Please install leinigen $WANTED_VERSION_MAJOR from "
        echo    " http://leiningen.org/#install"
    fi

fi
}

discoverLein
