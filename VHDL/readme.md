

# 🚀 VHDL (VHSIC Hardware Description Language) Kılavuzu

VHDL, elektronik sistemlerin, özellikle de **ASIC (Application-Specific Integrated Circuit)** ve **FPGA (Field-Programmable Gate Array)** gibi programlanabilir donanımların davranışsal ve yapısal özelliklerini tanımlamak için kullanılan standartlaştırılmış bir dildir.

-----

## 🎯 Temel Konseptler ve Mimarisi

VHDL'deki bir tasarım, genellikle iki ana bölümden oluşur:

### 1\. Entity (Varlık)

  * Bir devrenin **dış arayüzünü** (giriş ve çıkış portlarını) tanımlar.
  * Devrenin **ne yaptığını** değil, **neye benzediğini** (pinlerini) belirtir.

### 2\. Architecture (Mimari)

  * Entity tarafından tanımlanan arayüzün **iç işleyişini** veya **davranışını** tanımlar.
  * Bir Entity'nin birden fazla Architecture'ı olabilir (örneğin, aynı Entity için davranışsal, veri akışı ve yapısal yaklaşımlar).

#### 3 Ana Modelleme Stili:

| Stil | Tanım | Kullanım Alanı |
| :--- | :--- | :--- |
| **Davranışsal (Behavioral)** | İşlemleri, sırasal komutlar ve kontrol yapıları (`if`, `case`, `loop`) kullanarak yazılım diline benzer şekilde tanımlar. (Örn: Bir mikroişlemcinin çalışması) | Yüksek seviye soyutlama, test tezgahları (Testbenches) |
| **Veri Akışı (Dataflow)** | Sinyaller arasındaki atamaları (`<=`) kullanarak mantıksal denklemleri tanımlar. Tüm atamalar eş zamanlıdır. (Örn: Kombinasyonel mantık) | Ortadan yüksek seviye soyutlama, basit kombinasyonel devreler |
| **Yapısal (Structural)** | Devrenin, daha küçük alt bileşenlerin (`components`) birbirine nasıl bağlandığını gösteren bir netlist (bağlantı listesi) olarak tanımlanmasıdır. | Düşük seviye, fiziksel yerleşime yakın modelleme |

-----

## 🛠️ Temel VHDL Elemanları

### A. Kütüphaneler ve Paketler

  * **Kütüphane (Library):** Önceden derlenmiş VHDL birimlerinin (Entity, Package) depolandığı yerdir. En yaygın kullanılanlar:
      * `IEEE`: Standart mantıksal tipleri ve matematiksel işlemleri içerir.
      * `WORK`: Mevcut projenizin birimlerinin derlendiği kütüphanedir.
  * **Paket (Package):** Fonksiyonlar, prosedürler, yeni veri tipleri ve sabitler gibi genel tanımlamaları bir araya getirir.

### B. Veri Tipleri

VHDL, sıkı tipleme (strongly-typed) gerektiren bir dildir. En sık kullanılan tipler:

| Tip | Kütüphane | Tanım |
| :--- | :--- | :--- |
| **BIT / BIT\_VECTOR** | Standart | 0 veya 1. Çok az kullanılır. |
| **STD\_LOGIC / STD\_LOGIC\_VECTOR** | `IEEE.std_logic_1164` | `0`, `1`, `Z` (Yüksek empedans), `U` (Tanımsız) gibi 9 farklı değer alabilir. **Donanım sentezi için standarttır.** |
| **INTEGER** | Standart | Tamsayılar. Sentezleyiciler genellikle sınırlı bit genişliği atar. |
| **NATURAL / POSITIVE** | Standart | Pozitif tamsayılar. |
| **BOOLEAN** | Standart | `TRUE` veya `FALSE`. |

### C. Sinyaller ve Değişkenler

  * **Sinyal (Signal):** Fiziksel bir kabloyu veya devredeki bir bağlantıyı temsil eder. Atamalar (`<=`) **eş zamanlı** olarak gerçekleşir ve bir **gecikme** sonrasında yeni değeri alır (Gerçek donanımı taklit eder). **Mimari gövdesinde** tanımlanır.
  * **Değişken (Variable):** Geleneksel programlama dillerindeki değişkenlere benzer. Atamalar (`:=`) **anlık** olarak gerçekleşir. Yalnızca **Process'lerin** veya **Fonksiyon/Prosedürlerin** içinde tanımlanabilir.

### D. Process (İşlem Bloğu)

  * VHDL'de **sırasal mantığı** (Sequential Logic) modellemek için temel yapıdır.
  * Bir `PROCESS` bloğu içindeki tüm ifadeler sırasal olarak işlenir.
  * **Hassasiyet Listesi (Sensitivity List):** Process'in yeniden çalıştırılmasını tetikleyen sinyalleri içerir (Örn: `PROCESS(CLK, RESET)`).

<!-- end list -->

```vhdl
PROCESS (CLK)
BEGIN
    IF rising_edge(CLK) THEN
        -- CLK'in yükselen kenarında yapılacaklar
        Q <= D;
    END IF;
END PROCESS;
```

-----

## 🖥️ Tasarım Akışı (Design Flow)

VHDL, genellikle aşağıdaki adımları içeren bir donanım tasarım akışında kullanılır:

1.  **Tasarım Girişi (Design Entry):** VHDL kodunun yazılması.
2.  **Doğrulama/Simülasyon (Verification/Simulation):** Tasarımın bir **Test Tezgahı (Testbench)** kullanılarak, gerçek bir donanım üzerinde çalıştırılmadan önce işlevselliğinin kontrol edilmesi.
3.  **Sentez (Synthesis):** VHDL kodunun, hedef donanımın (FPGA/ASIC) temel mantık kapılarına, flip-flop'lara ve diğer yapı taşlarına dönüştürülmesi.
4.  **Yerleştirme ve Rota (Place and Route):** Sentezlenmiş mantığın yonga üzerindeki fiziksel konumlara yerleştirilmesi ve bağlantıların (routing) oluşturulması.
5.  **Zamanlama Analizi (Timing Analysis):** Devrenin maksimum çalışma frekansı gibi kritik zamanlama gereksinimlerini karşılayıp karşılamadığının kontrol edilmesi.
6.  **Programlama (Programming):** Sonuç dosyasının (örneğin, FPGA'e bir `.bit` dosyası) hedef donanıma yüklenmesi.

-----

## 📝 Pratik İpuçları

  * **Sentezlenebilirlik (Synthesizability):** Yazdığınız VHDL kodunun fiziksel bir donanıma dönüştürülebilir olması gerekir. Örneğin, sonsuz döngüler veya rastgele gecikmeler genellikle sentezlenemez.
  * **Dışarıdan Çıkarılan Donanım:** Sentezleyici, kodunuzdaki her yapıyı (IF, CASE, PROCESS) gerçek donanım elemanlarına (Mux, Flip-Flop, Logic Gates) dönüştürür.
  * **Kombinasyonel Mantık:** Eğer bir `PROCESS` bloğundaki hassasiyet listesinde kullanılan tüm giriş sinyallerini içermezseniz, sentezleyici **Mandallar (Latches)** oluşturabilir. Çoğu tasarımda mandallardan kaçınılmalıdır; bu nedenle, kombinasyonel process'lerde **tüm girişleri** hassasiyet listesine ekleyin. (VHDL-2008 ve sonrası için `ALL` anahtar kelimesi kullanılabilir.)

-----

## ✨ Örnekler (Examples)

### 1. LED Kırpma (Blink LED)
- **[Blink_LED.vhd](Blink_LED.vhd):** Zaman sayaçlı temel bir VHDL modülü. `clk` (Saat) sinyaline bağlı olarak LED durumunu değiştirir. 
- **[Blink_LED_tb.vhd](Blink_LED_tb.vhd):** Blink LED modülünün saat sinyali ve reset durumlarını test eden Testbench örneği.

-----

## 📚 Kaynaklar ve İleri Okuma

  * **IEEE 1076 Standardı:** VHDL'nin resmi standardı.
  * **EDA (Electronic Design Automation) Araçları:**
      * **Simülasyon:** ModelSim, QuestaSim, GHDL
      * **Sentez ve P\&R (FPGA):** Xilinx Vivado, Intel Quartus Prime
