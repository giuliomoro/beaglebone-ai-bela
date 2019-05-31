#!/bin/bash -ex

if [ ! "x${DISK}" = "x" ] ; then
	MLO=`ls ./deploy/am57xx_evm/MLO-am57xx_evm-v2019.04-rc4*`
	IMG=`ls ./deploy/am57xx_evm/u-boot-am57xx_evm-v2019.04-rc4*.img`
	sudo dd if=$MLO of=${DISK} count=2 seek=1 bs=128k
	sudo dd if=$IMG of=${DISK} count=4 seek=1 bs=384k

#	sudo dd if=./deploy/am57xx_evm_em/MLO-am57xx_evm_em-v2017.01-r0 of=${DISK} count=2 seek=1 bs=128k || true
#	sudo dd if=./deploy/am57xx_evm_em/u-boot-am57xx_evm_em-v2017.01-r0.img of=${DISK} count=4 seek=1 bs=384k || true

	sync
else
	echo Error, on DISK= specified
	exit 1 
fi
