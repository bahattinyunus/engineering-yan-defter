#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>

/* Modül lisans, yazar ve açıklama bilgileri (Modinfo'da görünür) */
MODULE_LICENSE("GPL");
MODULE_AUTHOR("Bahattin Yunus");
MODULE_DESCRIPTION("A Simple Hello World Kernel Module.");
MODULE_VERSION("1.0");

/* Modül yüklendiğinde (insmod komutuyla) çağrılacak fonksiyon */
static int __init hello_init(void) {
    printk(KERN_INFO "HelloModule: Modul basariyla yuklendi! Merhaba dunya.\n");
    return 0; /* 0 dönmesi işlemin başarılı olduğu anlamına gelir */
}

/* Modül kaldırıldığında (rmmod komutuyla) çağrılacak fonksiyon */
static void __exit hello_exit(void) {
    printk(KERN_INFO "HelloModule: Modul kaldirildi. Gorusmek uzere!\n");
}

/* Başlangıç ve bitiş fonksiyonlarını kernele tanıtıyoruz */
module_init(hello_init);
module_exit(hello_exit);
