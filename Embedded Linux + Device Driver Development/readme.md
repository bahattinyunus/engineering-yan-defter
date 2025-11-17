

# 🚀 ders-dışı-lab – Embedded Linux & Device Drivers

**Niş mühendisliğin laboratuvarı: Gömülü Linux ve kernel seviyesi geliştirme**

Merhaba! Burası, ders dışında kendi kendime öğrendiğim ve deneyerek geliştirdiğim **Embedded Linux ve Linux Device Driver projelerinin** toplandığı repo.

Embedded Linux, çoğu mühendislik dersinde kapsamlı işlenmez. Burada kullanıcı alanı yazılımı ile kernel katmanı arasındaki köprüyü kurmayı ve gerçek donanımı kontrol etmeyi öğreniyorum.

---

## 🔥 Bu Repo Neden Var?

* Embedded Linux ve Device Driver geliştirme, çok niş ve az bilinen bir alan.
* Gömülü cihazlarda kullanıcı alanı ile donanım arasındaki etkileşimi anlamak için.
* Ders dışı öğrenmenin ve deneyimin, gerçek mühendislik portföyüne dönüşmesini sağlamak.

---

## 🧠 Hedeflerim

* Linux kernel modülleri ve device driver yazmak
* Device Tree ile gömülü donanım tanımlamalarını anlamak
* SPI/I2C/GPIO gibi protokollerle kernel katmanında çalışmak
* Real-time veri işleme ve donanım kontrolü yapmak
* Embedded Linux üzerinde test ve debug yöntemlerini öğrenmek

---

## 🧩 İçerik

### 🔹 1) Embedded Linux Temelleri

* Kernel architecture ve user-space vs kernel-space
* Device Tree ve platform driver kavramları
* Kernel module yazımı: init, exit, read/write fonksiyonları
* Character ve block devices

### 🔹 2) Hardware & Protocols

* SPI, I2C, UART, GPIO ile donanım etkileşimi
* Memory-mapped I/O ve register kontrolü
* Real-time veri okuma ve yazma

### 🔹 3) Deneyler & Projeler

* Basit kernel module örnekleri
* I2C/SPI sensor okuma ve driver implementasyonu
* GPIO ile LED/motor kontrol
* Device Tree ile custom hardware entegrasyonu

### 🔹 4) Debug ve Analiz

* Kernel log analizi (`dmesg`)
* Module debug ve printk kullanımı
* Hata ayıklama ve optimizasyon notları

---

## 📚 Yapılandırma Önerisi

```
/embedded-linux
    /kernel-modules
    /device-drivers
    /device-tree
/hardware
    /spi
    /i2c
    /gpio
/debug
    /kernel-logs
    /trace
/projects
    /sensor-drivers
    /led-motor-control
```

---

## 🌱 Bu Repo Sürekli Büyüyor

Bugün basit bir kernel module yazarım, yarın I2C sensor driver eklerim, ertesi gün GPIO ile LED/motor kontrol projelerini test ederim.

Burası **sürekli güncellenen bir öğrenme ve deney laboratuvarı**dır.

---

## ✨ Son Söz

Embedded Linux ve Device Driver Development, ders dışı mühendisliğin en niş ve prestijli alanlarından biri.
Bu repo, benim öğrenme yolculuğumun kaydı ve diğer meraklı mühendisler için bir kaynak.

Yıldız bırakabilir, PR ve katkılarla projeye dahil olabilirsin ⭐

