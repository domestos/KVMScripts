#!/bin/bash
if [ $# -ne 3 ] ; then
	echo "Usage: $0 <NAME> <RAM_GB> <CPUs>"
	exit 1
fi

NAME=$1
RAM_MB=$(($2*1024))
VCPUS=$3

virt-install                            \
	--connect qemu:///system        \
	--virt-type kvm                 \
	--os-type=linux                 \
	--os-variant=ubuntu18.10              \
	--name=$NAME                    \
	--ram=$RAM_MB                   \
	--arch=x86_64                   \
	--disk path=/home/kvm_images/CPPM-VM-x86_64-6.6.2.86796-KVM-RAW-CP-VA.raw,format=raw,bus=scsi \
	--disk path=/home/kvm_images/CPPM-KVM-RAW-CP-VA.raw,format=raw,bus=scsi,SIZE=80 \
	--network bridge=br0,model=virtio            \
	--network bridge=vnet0,model=virtio            \
	--vcpus=$VCPUS                  \
	--graphics vnc                  \
	--import



  virt-install \
  --virt-type kvm \
   --name vm-01 \
   --vcpus 2 \
   --memory 4096 \
   --network network=varenik.lab,model=e1000  \
   --graphics spice \
   --video qxl \
   --disk vol=varenik.lab/disk01,format=raw  \
   --boot hd,cdrom \
   --cdrom=/mnt/kvm-disks/iso/ubuntu-gnome-17.04-desktop-amd64.iso \

   --hvm \
   --sound ac97 \
