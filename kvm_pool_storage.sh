#!/bin/bash
##########################################
#     CREATE STORAGE PATH
#########################################
if [ $# -ne 2 ] ; then
	echo -e "Please set two params: \n - pool \n - image path \nRUN EXAMPLE: $0 <POOL_NAME> <IMAGE_PATH>"
	exit 1
fi

POOL_NAME=$1
IMAGE_PATH=$2

#create folder IMAGE_PATH
if [ ! -d "$IMAGE_PATH" ]; then
		echo "folder was created:  $IMAGE_PATH"
    mkdir -p "$IMAGE_PATH"
fi;

virsh pool-define-as  --name "$POOL_NAME"  --type dir  --target "$IMAGE_PATH"
#activate pool as autostart"
virsh pool-autostart "$POOL_NAME"
virsh pool-list --all

############################# HELPER #################################################
# pool-define-as - створюється конфігураційний файл на нашому хості в не активному стані
# pool-define-as  --name local  --type dir  --target   /mnt/kvm-disks/
#--name local  - назва пула
#--type dir  - тип пула
#--target   /mnt/kvm-disks/  - шлях

# Storage Pool (help keyword 'pool'):
# find-storage-pool-sources-as   find potential storage pool sources
# find-storage-pool-sources      discover potential storage pool sources
# pool-autostart                 autostart a pool
# pool-build                     build a pool
# pool-create-as                 create a pool from a set of args
# pool-create                    create a pool from an XML file
# pool-define-as                 define a pool from a set of args
# pool-define                    define an inactive persistent storage pool or modify an existing persistent one from an XML file
# pool-delete                    delete a pool
# pool-destroy                   destroy (stop) a pool
# pool-dumpxml                   pool information in XML
# pool-edit                      edit XML configuration for a storage pool
# pool-info                      storage pool information
# pool-list                      list pools
# pool-name                      convert a pool UUID to pool name
# pool-refresh                   refresh a pool
# pool-start                     start a (previously defined) inactive pool
# pool-undefine                  undefine an inactive pool
# pool-uuid                      convert a pool name to pool UUID
