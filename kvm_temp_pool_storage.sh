#!/bin/bash

##########################################
#     CREATE TEMPORY STORAGE PATH       #
#########################################

if [ $# -ne 2 ] ; then
  echo -e "Please set two params: \n - pool \n - image path \nRUN EXAMPLE: $0 <POOL_NAME> <IMAGE_PATH>"
	exit 1
fi

POOL_NAME=$1
IMAGE_PATH=$2

virsh pool-create-as  --name "$POOL_NAME"  --type dir  --target "$IMAGE_PATH"
virsh pool-list --all
