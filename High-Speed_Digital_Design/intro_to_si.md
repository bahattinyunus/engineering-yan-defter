# İletim Hatları ve Sinyal Bütünlüğüne Giriş (Intro to Transmission Lines & SI)

Yüksek hızlı dijital tasarımda (High-Speed Digital Design), bir PCB üzerindeki bakır yollar (traces) artık basit birer "kısa devre" teli olarak davranmazlar; birer **İletim Hattı (Transmission Line)** haline gelirler. 

Sinyalin yükselme süresi (Rise Time - $t_r$), sinyalin PCB üzerindeki uçuş süresinden (Time of Flight - $t_{f}$) daha kısa veya ona yakınsa, iletim hattı etkileri (yansıma, zayıflama, crosstalk) devreye girer.

## Temel Kurallar ve Konseptler

### 1. Karakteristik Empedans ($Z_0$)
Bir iletim hattı boyunca sinyalin karşılaştığı anlık empedanstır. Genellikle 50 Ohm olarak tasarlanır (Diferansiyel hatlar için 90-100 Ohm). 
$Z_0 = \sqrt{\frac{L}{C}}$ 
Burada L hat endüktansı, C ise hat kapasitansıdır.

### 2. Yansımalar (Reflections) ve Terminatör (Termination)
Sinyal, karakteristik empedansı $Z_0$ olan bir hattan, yük empedansı $Z_L$ olan bir hedefe ulaştığında, empedans uyumsuzluğu varsa sinyalin bir kısmı kaynağa geri yansır.
Yansıma katsayısı $\rho$:
$\rho = \frac{Z_L - Z_0}{Z_L + Z_0}$
Bu yansımaları (Ringing, Overshoot, Undershoot) önlemek için **Empedans Uyumlama (Impedance Matching)** veya **Terminasyon** (Seri, Paralel, Thevenin) yapılır.

### 3. Çapraz Karışma (Crosstalk)
Birbirine yakın seyreden iki yüksek hızlı iletim hattı arasındaki elektromanyetik kuplajdır.
*   **NEXT (Near-End Crosstalk):** Sürücü (Driver) tarafında oluşan gürültü.
*   **FEXT (Far-End Crosstalk):** Alıcı (Receiver) tarafında oluşan gürültü.
Crosstalk'u azaltmak için hatlar arası mesafe artırılır (3W Kuralı) veya aralarına toprak (GND) via'ları yerleştirilir.

### 4. Göz Diyagramı (Eye Diagram)
Yüksek hızlı seri haberleşme sinyallerinin (PCIe, USB3, DDR) kalitesini analiz etmek için PRBS (Pseudo-Random Binary Sequence) verisinin üst üste bindirilmesiyle oluşturulan osiloskop grafiğidir. Göz ne kadar "açık" ise, sinyal kalitesi o kadar iyidir (daha az Jitter ve gürültü).
