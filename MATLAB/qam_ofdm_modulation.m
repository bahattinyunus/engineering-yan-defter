%% QAM ve OFDM Modülasyon Simülasyonu
% Bu script, modern kablosuz haberleşme sistemlerinin temeli olan 
% QAM ve OFDM modülasyon tekniklerini basitçe simüle eder.

clear; clc; close all;

%% 1. Parametreler
M = 16;                     % 16-QAM
k = log2(M);                % Bit sayısı
num_bits = 1200;            % Toplam bit sayısı
num_carriers = 64;          % OFDM taşıyıcı sayısı (Subcarriers)
cp_len = 16;                % Cyclic Prefix uzunluğu

%% 2. 16-QAM Modülasyonu
data_bits = randi([0 1], num_bits, 1);
data_reshaped = reshape(data_bits, length(data_bits)/k, k);
data_symbols = bi2de(data_reshaped);

% QAM Modülasyonu (MATLAB Built-in)
qam_modulated = qammod(data_symbols, M, 'UnitAveragePower', true);

figure;
plot(qam_modulated, 'o');
title('16-QAM Constellation');
grid on; axis square;

%% 3. OFDM İşlemi
% Sembolleri taşıyıcılara dağıt (Reshape to matrix)
num_ofdm_symbols = ceil(length(qam_modulated) / num_carriers);
ofdm_matrix = zeros(num_carriers, num_ofdm_symbols);
ofdm_matrix(1:length(qam_modulated)) = qam_modulated;

% IFFT (Frekans domeninden zaman domenine)
ofdm_time = ifft(ofdm_matrix, num_carriers);

% Cyclic Prefix Ekleme
ofdm_with_cp = [ofdm_time(end-cp_len+1:end, :); ofdm_time];

%% 4. Kanal ve Gürültü (AWGN)
snr = 20; % dB
rx_signal = awgn(ofdm_with_cp(:), snr, 'measured');

%% 5. OFDM Demodülasyon
% CP Kaldırma
rx_reshaped = reshape(rx_signal, num_carriers + cp_len, num_ofdm_symbols);
rx_no_cp = rx_reshaped(cp_len+1:end, :);

% FFT (Zaman domeninden frekans domenine)
rx_freq = fft(rx_no_cp, num_carriers);

% Sembolleri geri al
rx_symbols = rx_freq(1:length(qam_modulated));

%% 6. Sonuçları Görüntüle
figure;
subplot(2,1,1);
plot(real(ofdm_with_cp(:)));
title('OFDM Zaman Domeni Sinyali (CP ile)');
xlabel('Örnek'); ylabel('Genlik');

subplot(2,1,2);
plot(rx_symbols, 'r.');
title('Alınan 16-QAM Sembolleri (Gürültülü Kanal)');
grid on; axis square;

fprintf('Simülasyon tamamlandı. SNR: %d dB\n', snr);
