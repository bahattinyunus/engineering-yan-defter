obj-m += hello_module.o

# KERNELDIR varsayılan olarak sistemdeki mevcut çekirdek dizinini gösterir
# Çapraz derleme (Cross-Compile) yapılacaksa bu dizin değiştirilmelidir.
KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

all:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean
