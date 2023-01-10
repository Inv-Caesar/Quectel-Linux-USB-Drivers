KERNEL_VERSION := 6.1.0
KERNELDIR := /lib/modules/$(KERNEL_VERSION)/build
PWD       := $(shell pwd)

obj-m+=./drivers/usb/serial/usb_wwan.o
obj-m+=./drivers/usb/serial/option.o
obj-m+=./drivers/usb/serial/qcserial.o
obj-m+=./drivers/net/usb/qmi_wwan.o

modules: clean
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

install: modules
	cp $(PWD)/drivers/usb/serial/option.ko /lib/modules/$(KERNEL_VERSION)/kernel/drivers/usb/serial/
	cp $(PWD)/drivers/usb/serial/usb_wwan.ko /lib/modules/$(KERNEL_VERSION)/kernel/drivers/usb/serial/
	cp $(PWD)/drivers/usb/serial/qcserial.ko /lib/modules/$(KERNEL_VERSION)/kernel/drivers/usb/serial/
	cp $(PWD)/drivers/net/usb/qmi_wwan.ko /lib/modules/$(KERNEL_VERSION)/kernel/drivers/net/usb/
	modprobe -r option qcserial  qmi_wwan
	depmod -a

clean:
	rm -rf *~ .tmp_versions modules.order Module.symvers
	find . -type f -name *~ -o -name *.o -o -name *.ko -o -name *.cmd -o -name *.mod.c -o -name *.mod |  xargs rm -rf
