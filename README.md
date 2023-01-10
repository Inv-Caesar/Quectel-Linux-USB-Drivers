# Quectel-Linux-USB-Drivers
Script for installing the Quectel USB modem Linux drivers for kernel 6.0 / 6.1.

Supported devices: UCxx/EC2x/EGxx/EP06/EM06/BG96/AG35.

# Step 1: Check kernel version.
```
$ ls /lib/modules/
6.0.0
```
Note: using "uname -r" may not be accurate, as the file system folder names may not reflect the actual kernel version

# Step 2: Clone repository.
```
$ git clone https://github.com/Inv-Caesar/Quectel-Linux-USB-Drivers.git 
$ cd Quectel-USB-Serial-Drivers
```

# Step 3: Check the kernel version in the Makefile is the same as your system, change as necessary.
```
$ nano Makefile

KERNEL_VERSION := 6.0.0 # Change to your system version
KERNELDIR := /lib/modules/$(KERNEL_VERSION)/build
PWD       := $(shell pwd)
```
Save and quit.

# Step 4: Compile and install the drivers
```
$ make 
$ sudo make install
$ sudo reboot
```

# Step 5: Check devices recognised
```
$ ls /dev/ttyUSB*
/dev/ttyUSB0 /dev/ttyUSB1 /dev/ttyUSB2 /dev/ttyUSB3
```
