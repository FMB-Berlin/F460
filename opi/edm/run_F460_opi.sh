#!/bin/bash

#get the script's dir
THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export EDMDATAFILES=${EDMDATAFILES}:${THISDIR}


edm -x -eolc -m "P=E1:,R=F460:" F460.edl
