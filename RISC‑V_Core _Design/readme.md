

# 🚀 ders-dışı-lab – RISC‑V Core Design

**Niş mühendisliğin laboratuvarı: FPGA ile RISC‑V CPU tasarımı**

Merhaba! Burası, ders dışında kendi kendime öğrendiğim, deneyip bozduğum ve tekrar denediğim **RISC‑V işlemci tasarım notları** ve projelerimi paylaştığım repo. FPGA ile başlıyor, RISC‑V’nin derinliklerine iniyor, gerçek bir CPU tasarlamanın heyecanını sunuyor.

Bu repo hem **öğrenme günlüğü**, hem de **niş mühendislik deneyimi** arayanlar için kaynak.

---

## 🔥 Bu Repo Neden Var?

* RISC‑V ve CPU tasarımı çoğu mühendislik dersinde yok.
* “Öğrenmek için yapmak lazım” mantığıyla deneyimlerimi burada topluyorum.
* FPGA ve RISC‑V kombinasyonu, niş ve değerli bir yetenek seti oluşturuyor.

---

## 🧠 Hedeflerim

* FPGA üzerinde basit ve orta seviye bir RISC‑V core tasarlamak
* Instruction set mimarisini anlamak ve uygulamak
* Pipeline tasarımı ve optimizasyonunu deneyimlemek
* CPU tasarımında debug, simülasyon ve timing analizi yapmak
* Ders dışı öğrenmenin gerçek bir mühendislik portföyüne dönüşmesini sağlamak

---

## 🧩 İçerik

### 🔹 1) RISC‑V Instruction Set & Architecture

* RV32I ve RV32E temelleri
* Register file yönetimi
* ALU ve control unit tasarımı
* Branch, jump ve load/store komutları

### 🔹 2) Pipeline Tasarımı

* 5-stage pipeline: IF, ID, EX, MEM, WB
* Hazırlık: forwarding, hazard detection
* Pipeline optimizasyon teknikleri
* Basit ve orta seviye örnekler

### 🔹 3) FPGA Implementation

* Basit RISC‑V core’u FPGA üzerinde çalıştırmak
* Modüler HDL tasarım ve testbench
* Clock ve reset yönetimi
* Timing analysis ve synthesis deneyleri

### 🔹 4) Debug ve Simülasyon

* Waveform analizleri
* Instruction trace ve debug logları
* Hata ayıklama notları ve çözümler

### 🔹 5) Deneyler & Projeler

* Mini RISC‑V CPU örnekleri
* Pipeline ile basit hesaplama modülleri
* GPIO/LED output testleri
* Küçük I/O modülleri ile FPGA-RISC‑V entegrasyonu

---

## 📚 Yapılandırma Önerisi

```
/riscv
    /instruction-set
    /pipeline
    /alu
    /control-unit
    /register-file
/fpga
    /projects
    /testbench
    /synthesis
/debug
    /waveforms
    /logs
```

---

## 🌱 Bu Repo Sürekli Büyüyor

Her deney bir sonraki deney için temel oluşturur.
Bugün bir modül eklerim, yarın pipeline’ı optimize ederim, ertesi gün FPGA üzerinde test ederim.

Burası **sürekli güncellenen bir öğrenme ve deney laboratuvarı**dır.

---

## 💻 Örnek Modüller (Examples)

### 1. RV32I Instruction Decoder
- **[rv32i_decoder.v](rv32i_decoder.v):** RISC-V 32-bit (RV32I) komut seti mimarisi için 32 bitlik komut dizesini (instruction) analiz edip R-Type, I-Type, Load, Store, Branch gibi operasyonları ve operand register adreslerini ayıran temel bir Verilog decoder (kod çözücü) modülü. 

---

## ✨ Son Söz

RISC‑V tasarımı, ders dışı mühendislik merakının en niş ve prestijli alanlarından biri.
Bu repo, benim öğrenme yolculuğumun kaydı ve diğer meraklı mühendisler için bir kaynak.

Takip etmek istersen yıldız bırakabilirsin ⭐
PR’lar ve katkılar her zaman açık 💡


