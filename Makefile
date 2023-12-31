# SPDX-License-Identifier: GPL-2.0-or-later
#
# Makefile - AMD SFH HID drivers
# Copyright (c) 2019-2020, Advanced Micro Devices, Inc.
#
#
obj-m += amd_sfh.o

KVERSION = $(shell uname -r)
all:
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) modules
clean:
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) clean

amd_sfh-objs := amd_sfh_hid.o
amd_sfh-objs += amd_sfh_client.o
amd_sfh-objs += amd_sfh_pcie.o
amd_sfh-objs += hid_descriptor/amd_sfh_hid_desc.o

ccflags-y += -I $(PWD)
