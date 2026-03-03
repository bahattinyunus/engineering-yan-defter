# Donanım Truva Atları ve Yan Kanal Saldırıları (Hardware Trojans & Side-Channel)

Modern donanım güvenliğinde sistemleri korumak sadece yazılım açıklarıyla sınırlı değildir. Fiziksel donanımın kendisi de saldırılara maruz kalabilir.

## 1. Yan Kanal Saldırıları (Side-Channel Attacks - SCA)
Bir kriptografik algoritma matematiksel olarak kırılamayacak kadar güçlü olsa bile, bu algoritmayı çalıştıran fiziksel donanımın etrafa yaydığı fiziksel sızıntılar ölçülerek gizli anahtarlar ele geçirilebilir.

*   **Güç Analizi (Power Analysis - DPA/CPA):** İşlemcinin şifreleme yaparken çektiği anlık akım değişimlerinin bir osiloskop ile ölçülmesi ve istatistiksel metotlarla (Correlation Power Analysis) gizli anahtarın (Örn: AES anahtarı) bulunmasıdır.
*   **Zamanlama Saldırıları (Timing Attacks):** Bir şifreleme işleminin veya koşullu dallanmanın ne kadar sürdüğünün ölçülmesidir. Eğer işlem süresi işlenen veriye/anahtara bağlıysa, saldırgan süreleri ölçerek anahtarı tahmin edebilir.
*   **Elektromanyetik (EM) Analiz:** Çip çalışırken etrafına yaydığı EM radyasyonunun bir prob (anten) ile dinlenerek tıpkı güç analizindeki gibi şifrelerin kırılmasıdır.

## 2. Donanım Truva Atları (Hardware Trojans)
IC tasarımı küreselleşmiş bir süreçtir. Tasarım ABD'de yapılabilir, IP blokları Avrupa'dan alınabilir ve üretim Asya'daki bir Dökümhanede (Foundry) gerçekleşebilir. Bu tedarik zinciri donanım truva atlarına kapı aralar.

*   **Tanım:** Kötü niyetli kişilerin (veya dökümhanelerin) entegre devrenin orijinal tasarımına gizlice ekledikleri ekstra mantık kapıları veya devrelerdir.
*   **Tetikleyici (Trigger):** Truva atını uyandıran özel bir koşuldur (Belli bir sayacın dolması, spesifik bir veri dizisinin gelmesi veya sıcaklık değişimi).
*   **Yük (Payload):** Truva atı uyandığında çalışan zararlı aksiyondur (Sistemi durdurma/Kill Switch, gizli kripto anahtarlarını dışarı sızdırma veya yetki yükseltme).

### Korunma Yöntemleri:
1.  **Güvenli Tasarım (Secure Design):** Yan kanal analizlerine karşı Maskeleme (Masking) ve Gizleme (Hiding) teknikleri (Örn: Sabit süreli şifreleme algoritmaları, dengeli güç tüketimi tasarımları).
2.  **Optik ve Tersine Mühendislik:** Üretilmiş çipin elektron mikroskobuyla incelenerek orijinal GDSII tasarımıyla karşılaştırılması.
3.  **Mantıksal Testler:** Çipin olağandışı durumlarda nasıl davrandığının ATPG (Automatic Test Pattern Generation) yöntemleriyle sınır testlerine tabi tutulması.
