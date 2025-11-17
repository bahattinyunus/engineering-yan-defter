

# 🏭 **PLC NEDİR? (Gerçekçi, net tanım)**

PLC (Programmable Logic Controller) bir nevi:

**“Endüstri için özel üretilmiş, çelik gibi sağlam, çökmesi neredeyse imkânsız bir bilgisayar.”**

Arduino/Raspberry gibi hobi kartları *oyuncak* kalıyor.
PLC’ler ise:

* 7/24 çalışır
* Toz, yağ, titreşim, ısı farkı dinlemez
* Kritik makineleri kontrol eder
* “DUR” diyecekse durdurur, “ÇALIŞ” diyecekse çalıştırır

Kısacası fabrikaların sinir sistemi.

---

# 🔧 **PLC’nin İç Yapısı Nasıldır?**

1. **CPU**

* Ladder, ST, FBD gibi dilleri çalıştıran işlemci
* Gerçek zamanlı çalışır
* Döngüler milisaniye bazındadır

2. **Dijital Input (DI)**

* Buton, sensör, limit switch bilgisi alır
* 0/1 sinyaller

3. **Dijital Output (DO)**

* Motoru, valfi, kontaktörü tetikler
* Röle çıkışlı veya transistor çıkışlı olur

4. **Analog Input / Output**

* 4-20 mA, 0-10V gibi endüstri standardı sinyaller
* Sıcaklık, basınç, seviye ölçer

5. **Haberleşme**

* Modbus
* Profibus
* Profinet
* CAN
* Ethernet/IP
  Bunlar fabrika protokolleri.

6. **Güçlü izolasyon ve dayanıklılık**

* Elektriksel gürültü korumalı
* Sanayi için sertifikalı

---

# 🧠 **PLC’nin Dillerine Bakalım**

Endüstriyel programlama dilleri IEC 61131-3 standardından gelir:

### 🪜 **1) Ladder Diagram (LAD)**

Elektrik şeması gibi çizilir.
En yaygın olanıdır.
Elektrikçiler bayılır.

### 🔲 **2) Function Block Diagram (FBD)**

Blok blok sürükle-bırak
İşlevsel programlama gibi

### 📝 **3) Structured Text (ST)**

C’ye benzeyen kod
Mühendisin en sevdiği 😁

### 🔁 **4) SFC / GRAFCET**

Adım adım proses yönetir

---

# ⚙️ PLC Ne İçin Kullanılır?

* Üretim hatları
* Makine otomasyonu
* Asansörler
* Konveyör sistemleri
* CNC ön hazırlıkları
* Dolum makineleri
* Robotik hücreler
* Fırın, kazan, sıcaklık kontrol
* Otomatik kapı sistemleri
* Endüstriyel proses kontrol

Kısacası fabrikada dönen her şeyin arkasında PLC vardır.

---

# 💣 PLC’nin Arduino ve Raspberry’ye Göre Farkı

| Özellik                  | Arduino | Raspberry    | PLC                    |
| ------------------------ | ------- | ------------ | ---------------------- |
| Endüstriyel dayanıklılık | ❌       | ❌            | ✔✔✔                    |
| 7/24 kesintisiz çalışma  | Orta    | Orta         | **Çok yüksek**         |
| Gerçek zamanlı kontrol   | Orta    | Zayıf        | **Çok iyi**            |
| Programlama dili         | C++     | Python/Linux | Ladder, ST, FBD        |
| Giriş/çıkış güvenliği    | Düşük   | Düşük        | **Endüstri standardı** |
| Hata toleransı           | Düşük   | Düşük        | Çok yüksek             |
| Fiyat                    | Ucuz    | Orta         | Pahalı                 |

PLCler kolay kolay çökmez.
Raspberry Pi yazın güneşte dursa “kardeşim ben ısınıyorum” diye kapanır.
PLC taş olsa yarılır, o kapanmaz. 😄

---

# 🔌 PLC Markaları

### Premium:

* **Siemens (S7-1200, S7-1500)**
* **Allen-Bradley (Rockwell Automation)**
* **Omron**

### Uygun fiyatlı:

* Delta
* Mitsubishi
* Fatek
* Unitronics

---

# 🚀 PLC’nin En Büyük Gücü: Deterministik Çalışma

PLC döngüsü (scan time):

1. Inputları oku
2. Programı çalıştır
3. Outputları yaz

Bu döngü **milisaniye hassasiyetinde** sabittir.
Yani *her zaman aynı anda* işler yapılır.

Bu, üretim hatları için hayati bir özellik.

---

# 🧩 PLC ile HMI

Birçok fabrika hattında dokunmatik ekran görürsün → buna **HMI** denir.

* Operatör bu ekrandan ayar yapar
* Alarm geçmişi görür
* PLC ile sürekli haberleşir

PLC + HMI = Endüstriyel otomasyonun kalbi

---

# 💬 Peki PLC vs FPGA nasıl?

| Özellik           | PLC         | FPGA                           |
| ----------------- | ----------- | ------------------------------ |
| Kullanım alanı    | Endüstri    | Savunma / telekom / yüksek hız |
| Gerçek zamanlılık | İyi         | Mükemmel                       |
| Programlama       | Ladder / ST | Verilog/VHDL                   |
| Zorluk            | Kolay       | Zor                            |
| Giriş seviye      | Kolay       | Orta-zor                       |
| Dayanıklılık      | Çok yüksek  | Orta                           |
| İşlem gücü        | Düşük/Orta  | Çok yüksek (paralel)           |
| Fiyat             | Orta/Pahalı | Pahalı                         |

---

# 🎯 Sonuç:

**PLC → Fabrika, üretim, proses, makine
FPGA → Yüksek hız, sinyal işleme, gerçek zamanlı bilimsel işler**

İkisi birbirinin alternatifi değil.
Farklı kategorilerin boss’ları.



# 🥇 **1) PLC Programlamaya Nasıl Başlanır? (Sıfırdan → Pro Seviyeye Yol Haritası)**

Aşama aşama, net bir roadmap veriyorum:

---

## 🧱 **Aşama 1: PLC Mantığını Öğren**

Önce şu kavramları oturtacaksın:

* PLC scan cycle (okuma → çalışma → yazma döngüsü)
* DI/DO (Dijital giriş-çıkış)
* AI/AO (Analog giriş-çıkış)
* Röle – kontaktör – sensör mantığı
* Endüstriyel voltajlar (24V DC standardı)
* Müşür, proximite, limit switch mantığı

Bunlar sağlam oturunca zaten “otomasyon dili” çözülür.

---

## 🪜 **Aşama 2: Ladder Diagram’ı Öğren**

En yaygın dil → Ladder.
Elektrik şeması gibi çalıştığı için anlaması kolay.

Bilmen gerekenleri yazayım:

* Normally Open / Normally Closed kontak
* Coil (çıkış)
* Timer (TON/TOF)
* Counter (CTU/CTD)
* Latching (self-hold) mantığı
* Edge detection (pozitif/negatif tetik)

Bunlar PLC dünyasının **alfabesi**.

---

## 🧠 **Aşama 3: Structured Text (ST) öğren (Mühendis modu)**

Ladder başlangıç için iyi ama ST gerçek güç.

ST’nin güzelliği:

* IF – ELSE
* FOR – WHILE
* Fonksiyon oluşturma
* Yapısal programlama
* Değişken tipleri, array, struct

Bunları öğrendiğinde PLC = “C programladığın” bir makineye dönüşür.

---

## 🛠 **Aşama 4: Bir PLC simülatörü indir**

Cihaz almana gerek yok.
En popüler ücretsiz simülatör:

* **Siemens LOGO! Soft Comfort (demo)**
* **Factory I/O (3D fabrika simülatörü) + PLC Driver**
* **Codesys** (en kral ücretsiz ortam)
* **Mitsubishi GX Works demo**
* **Delta WPLSoft**

**Codesys** → En geniş platform, ST öğrenmek için şahane.

---

## ⚙️ **Aşama 5: I/O bağlama mantığını öğren**

Bir PLC giriş-çıkışı nasıl okunur?

* DI = buton, switch, sensör
* DO = motor, lamba, valf
* Analog = sıcaklık, nem, pot

Bu kısım “elektrik mantığı” → otomasyonun temeli.

---

## 🚀 **Aşama 6: Küçük projelerle kendini geliştir**

Başlangıç projeleri:

* Bir butona basınca motor çalışsın (latching)
* Timer ile gecikmeli çalıştırma
* Conveyor bant kontrolü
* Trafik lambası kontrolü
* Servo vana açma-kapama
* Sıcaklık PID kontrol

Bu mini projeler → seni ustalığa götürür.

---

# 🥉 **3) PLC + Sensör + Motor Örnek Proje (Gerçek Fabrika Senaryosu)**

Aşırı net, anlaşılır bir örnek veriyorum:
**Konveyör bandı + sensör + DC motor**

---

# 🔧 **Sistem Bileşenleri**

* PLC (S7-1200 örnek alalım)
* 1 adet **proximity sensör** (metal algılayan)
* 1 adet **DC motor** + sürücü (24V)
* 1 adet **start butonu**
* 1 adet **stop butonu**
* 1 adet **emergency stop**
* Motor kontaktörü (sanayi tipi)

---

# 🧠 **Çalışma Mantığı**

1. Start’a basınca konveyör çalışmaya başlasın
2. Sensör bir cismi algıladığı anda motor 2 saniye dursun
3. 2 saniye sonra motor tekrar çalışsın
4. Stop’a basılırsa sistem tamamen dursun
5. Acil stop her şeyi anında kessin

Bu tam bir “endüstri simülasyonu” örneği.

---

# 🔌 **Bağlantılar**

* Start → PLC DI0
* Stop → PLC DI1
* Emergency → PLC DI2 (NC)
* Sensör → PLC DI3
* Motor çıkışı → PLC DO0 → Kontaktör → Motor

---

# 🪜 **Ladder Programı (Basit Mantık)**

### **Rung 1 — Motor Latching**

```
Start    Stop    Emergency         Motor_Coil
 --| |----|/|-------|/|------------- ( )
         \
          \----- Motor_Coil
```

Mantık:

* Start bas → motor çalışır
* Motor_Coil kendini tutar
* Stop veya Emergency → motoru keser

---

### **Rung 2 — Sensör Algılarsa 2 Saniye Dur**

```
Sensor   Timer(TON 2s)
 --| |--------- (T1)
```

### **Rung 3 — Motoru Timer ile Kontrol Et**

```
Motor_Coil    T1
   | |--------|/|----------- (Motor_Run)
```

Motor_Run → gerçek çıkışa yazılacak sinyal.

---

# 🟢 **Çalışmanın final hali**

* Start → motor döner
* Sensör bir şey görünce motor 2 saniye durur
* 2 saniye sonra otomatik devam eder
* Stop → motor kesilir
* Emergency → her şeyi öldürür

Bu tam bir **mini üretim hattı**.

---
