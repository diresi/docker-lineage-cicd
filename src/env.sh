#!/bin/bash

_SROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


DEVICE_LIST='serranoltexx,bacon'
RELEASE_TYPE='UNOFFICIAL'
BRANCH_NAME='lineage-18.1'

OTA_URL='https://android.rissner.net/api'
INCLUDE_PROPRIETARY=true

SIGN_BUILDS=true
KEYS_SUBJECT='/C=AT/ST=Styria/L=Graz/O=Android/OU=Android/CN=Android/emailAddress=resi@rissner.net'

WD=$PWD
KEYS_DIR=$WD/keys
ZIP_DIR=$WD/zips
SRC_DIR=$WD/src
LOGS_DIR=$WD/logs

mkdir -p $KEYS_DIR $ZIP_DIR $SRC_DIR $LOGS_DIR

WITH_SU=true
SIGNATURE_SPOOFING="restricted"
CUSTOM_PACKAGES="GmsCore GsfProxy FakeStore MozillaNlpBackend NominatimNlpBackend com.google.android.maps.jar FDroid FDroidPrivilegedExtension"


USE_CCACHE=1
ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"

DELETE_OLD_ZIPS=3
DELETE_OLD_LOGS=3

BUILD_OVERLAY=false
LOCAL_MIRROR=false
CLEAN_OUTDIR=false
CLEAN_AFTER_BUILD=false
