# 🤖 ders-dışı-lab – Robotik ve Kontrol Sistemleri

**Otonomi, kontrol teorisi ve robot etiğinin kesişimi.**

Merhaba! Burası, robotik sistemleri, ROS2 (Robot Operating System) mimarisini, kontrol algoritmalarını (PID, LQR, MPC) ve mekanik kinematik/dinamik modellerini incelediğim bölüm.

---

## 🔥 Neden Robotik?
Robotik donanım ve yazılımın en entegre çalıştığı mühendislik alanlarından biri. Bir algoritmanın fiziksel dünyada saniyeler içinde mekanik bir harekete dönüştüğünü görmek, mühendisliğin zirvelerinden biridir.

---

## 🧭 İçerik (Contents)

### 🔹 1. ROS2 (Robot Operating System 2) Temelleri
*   Nodes, Topics, Services ve Actions
*   QoS (Quality of Service) profilleri ve DDS arayüzü
*   URDF (Unified Robot Description Format) ve Gazebo/Ignition Simülasyonu
*   Nav2 (Navigation 2) ve SLAM algoritmaları

### 🔹 2. Kontrol Sistemleri (Control Systems)
*   **PID Kontrol:** Oransal, integral ve türev kontrol ile hata minimizasyonu.
*   **İleri Düzey:** Model Predictive Control (MPC) ve Linear-Quadratic Regulator (LQR).
*   Sistem modelleme ve transfer fonksiyonları.

### 🔹 3. Kinematik ve Dinamik (Kinematics & Dynamics)
*   İleri ve Ters Kinematik (Forward & Inverse Kinematics).
*   Denavit-Hartenberg (DH) parametreleri.
*   Hareket planlama ve yörünge izleme.

---

## 💻 Örnekler (Examples)

### 1. Basit Bir ROS2 Yayımcısı (Publisher Node)
- **[ros2_simple_publisher.py](ros2_simple_publisher.py):** Robotik dünyasının "Hello World"ü! Bu basit python scripti, ROS2 ekosistemi içerisinde saniyede bir kez log mesajı yayınlayan bir düğüm oluşturur. Bu düğüm, sensör verilerinin ROS2 topikleri üzerinden nasıl aktarıldığının temelini gösterir.

---

## 🚀 Çalıştırma (Running)

ROS2 sistemlerinin çalışması için işletim sisteminizde ROS2 (Humble, Iron, vb.) kurulu olmalıdır. Publisher örneğini çalıştırmak için:
```bash
# İlk olarak gerekli bağımlılıklarla çalıştırılabilir hale getirin
chmod +x ros2_simple_publisher.py

# ROS2 çalışma alanınızı kaynaklayın (örnek: Humble)
source /opt/ros/humble/setup.bash

# Python scriptini çalıştırın
python3 ros2_simple_publisher.py
```
