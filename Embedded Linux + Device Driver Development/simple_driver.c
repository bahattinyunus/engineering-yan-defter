#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Bahattin Yunus");
MODULE_DESCRIPTION("A simple Linux driver for demonstration");
MODULE_VERSION("0.1");

static int __init simple_driver_init(void) {
    printk(KERN_INFO "SimpleDriver: Hello from the kernel space!\n");
    return 0;
}

static void __exit simple_driver_exit(void) {
    printk(KERN_INFO "SimpleDriver: Goodbye from the kernel space!\n");
}

module_init(simple_driver_init);
module_exit(simple_driver_exit);
