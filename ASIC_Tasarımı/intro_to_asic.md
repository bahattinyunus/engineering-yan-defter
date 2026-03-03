# 🚀 ASIC Tasarım Akışına Giriş (Introduction to ASIC Design Flow)

ASIC (Application-Specific Integrated Circuit), belirli bir uygulamaya veya amaca yönelik olarak özel olarak tasarlanmış entegre devrelerdir. Genel amaçlı mikroişlemcilerin veya programlanabilir FPGA'lerin aksine, ASIC'ler maksimum performans, minimum güç tüketimi ve seri üretimde düşük maliyet sunar.

Standart bir ASIC tasarım akışı, genellikle aşağıdaki temel aşamalardan oluşur:

---

## 1. Spesifikasyon ve Mimari Belirleme (Specification & Architecture)
Her çip tasarımı bir fikirle başlar. Çipin ne işe yarayacağı, hangi arayüzleri destekleyeceği, hedef saat frekansı, güç tüketimi limitleri ve silikon alanı (PPA - Power, Performance, Area) bu aşamada belirlenir.
*   **Çıktılar:** Mimari dokümanlar, blok diyagramlar, yazılım ve donanım arayüzü tanımları (Hardware/Software Interface - HSI).

## 2. Mantıksal Tasarım (Logic / RTL Design)
Belirlenen mimari, VHDL, Verilog veya SystemVerilog gibi donanım tanımlama dilleri kullanılarak yazılır. Bu aşamada tasarımın register-transfer level (RTL) kodu oluşturulur.
*   **Araçlar:** Metin editörleri (VS Code, Vim), Linting araçları (SpyGlass).
*   **Çıktılar:** RTL kodları.

## 3. Mantıksal Doğrulama (Functional Verification)
Yazılan RTL kodunun, spesifikasyonlarda belirlenen işlevleri tam olarak yerine getirip getirmediği kontrol edilir. Bu, ASIC sürecindeki en uzun ve maliyetli aşamadır. UVM (Universal Verification Methodology) gibi metodolojiler kullanılarak test tezgahları (Testbenches) yazılır.
*   **Araçlar:** Xcelium, VCS, Questa.
*   **Çıktılar:** Test raporları, kapsam (Coverage) metrikleri.

## 4. Mantıksal Sentez (Logic Synthesis)
Doğrulanmış RTL kodu, hedef dökümhanenin (Foundry - örn. TSMC, GlobalFoundries) sağladığı Standart Hücre Kütüphanesine (Standard Cell Library) haritalanır. RTL kodu; mantık kapılarına (AND, OR, Flip-Flops) dönüştürülür.
*   **Araçlar:** Design Compiler, Genus.
*   **Çıktılar:** Gate-Level Netlist, SDC (Zamanlama kısıtlamaları) dosyası.

## 5. Test Edilebilirlik İçin Tasarım (Design for Test - DFT)
Çip üretildikten sonra silikonda fiziksel hatalar olup olmadığını test edebilmek için tasarıma ekstra test mantığı (Scan Chains, BIST, JTAG) eklenir. Sentez aşaması ile iç içedir.

## 6. Fiziksel Tasarım (Physical Design / PnR)
Gate-level netlist'in fiziksel bir silikon düzenine (layout) dönüştürüldüğü aşamadır.
*   **Kat Planlama (Floorplanning):** Güç ağlarının oluşturulması ve makro/IP bloklarının konumlandırılması.
*   **Yerleştirme (Placement):** Standart hücrelerin makro bloklar arasındaki boşluklara yerleştirilmesi.
*   **Saat Ağacı Sentezi (Clock Tree Synthesis - CTS):** Saat sinyalinin tüm flip-flop'lara minimum sapma (skew) ile ulaşmasını sağlayacak ağacın oluşturulması.
*   **Rota (Routing):** Hücrelerin aralarındaki bağlantıların (metal katmanları kullanarak) çizilmesi.
*   **Araçlar:** Innovus, IC Compiler II.

## 7. Fiziksel Doğrulama ve Sign-off (Physical Verification & Sign-off)
Fiziksel tasarımın üretim kurallarına ve zamanlama gereksinimlerine uyup uymadığı kontrol edilir.
*   **STA (Static Timing Analysis):** Zamanlama ihlali (Setup/Hold) olup olmadığı kontrolü.
*   **DRC (Design Rule Check):** Metal genişlikleri, boşluklar gibi dökümhane üretim kurallarına uygunluk.
*   **LVS (Layout vs Schematic):** Çizilen fiziksel tasarımın (Layout), mantıksal tasarımla (Netlist) birebir aynı olup olmadığının kontrolü.
*   **Araçlar:** Calibre (DRC/LVS), Voltus, Tempus, PrimeTime.

## 8. Üretime Gönderme (Tapeout)
Tüm kontrollerden geçen tasarım verisi (Genellikle GDSII formatında), fabrikaya (Foundry) üretime gönderilir. Bu aşama, aylarca süren tasarım sürecinin zirvesidir. Artık "Zarlar atılmıştır" (Tape out or Die).

---

Bu akış oldukça karmaşıktır ve her bir adımında uzmanlaşmış mühendisler (RTL Designer, Verification Engineer, Physical Design Engineer vb.) çalışır. Bu not defterinde süreç boyunca edindiğim notları ve karşılaştığım pratik çözümleri biriktirmeyi hedefliyorum.
