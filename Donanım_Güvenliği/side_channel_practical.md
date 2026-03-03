# Pratik Yan Kanal Analizi Notları (Practical Side-Channel Analysis)

Bu doküman, teorik bilgilerin ötesinde, yan kanal saldırılarının (Side-Channel Attacks) pratikte nasıl uygulandığına dair notlar içerir.

## 1. Diferansiyel Güç Analizi (DPA) Süreci

DPA, istatistiksel yöntemler kullanarak güç tüketimi verilerinden gizli anahtarı çıkarma yöntemidir.

### Adımlar:
1.  **Veri Toplama:** Cihaz aynı gizli anahtarla birçok farklı (ve bilinen) düz metin (plaintext) şifrelerken güç tüketimi (power traces) osiloskop ile kaydedilir.
2.  **Güç Tahmini Formülasyonu:** Anahtarın bir parçası (örn. 1 byte) için tüm olası değerler (0-255) tahmin edilir. Her tahmin için intermediate bir değer (örn. S-Box çıkışı) hesaplanır.
3.  **Hipotez Kurma:** Ham güç tüketimi verileri ile tahmin edilen güç tüketimi (genellikle Hamming Weight veya Hamming Distance modeli) arasındaki korelasyon hesaplanır.
4.  **Analiz:** En yüksek korelasyonu veren anahtar tahmini, büyük olasılıkla doğru anahtardır.

## 2. Korelasyon Güç Analizi (CPA)

CPA, DPA'nın daha gelişmiş bir türevidir ve Pearson Korelasyon Katsayısını kullanır.

### Python ile Basit Bir CPA İskeleti (Kavramsal)

```python
import numpy as np

def calculate_cpa(traces, plaintexts, key_guess):
    # Traces: [num_traces, time_samples]
    # Plaintexts: [num_traces]
    
    # 1. Tahmini güç tüketimini hesapla (Hamming Weight modeli)
    hypothetical_power = []
    for p in plaintexts:
        intermediate = sbox[p ^ key_guess]
        hypothetical_power.append(hamming_weight(intermediate))
    
    # 2. Korelasyonu hesapla
    correlations = []
    for t in range(traces.shape[1]):
        corr = np.corrcoef(hypothetical_power, traces[:, t])[0, 1]
        correlations.append(abs(corr))
        
    return max(correlations)
```

## 3. Donanım Seviyesinde Savunma (Countermeasures)

*   **Masking (Maskeleme):** Ara değerlerin rastgele bir 'maske' ile XOR'lanması. Böylece güç tüketimi doğrudan veriye bağlı olmaz.
*   **Hiding (Gizleme):** Güç tüketimini zamana yaymak (shuffling) veya gürültü ekleyerek (noise generation) SNR oranını düşürmek.
*   **Dual-Rail Circuits:** Veri ne olursa olsun çekilen akımı sabit tutan özel devre tasarımları.
