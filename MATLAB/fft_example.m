% =========================================================================
% Basic FFT (Fast Fourier Transform) Example
% This script generates a composite signal with multiple frequencies
% and noise, then calculates and plots its frequency spectrum using FFT.
% =========================================================================

% 1. Signal Parameters
Fs = 1000;            % Sampling frequency (Hz)
T = 1/Fs;             % Sampling period (s)
L = 1500;             % Length of signal (samples)
t = (0:L-1)*T;        % Time vector

% 2. Generate a signal with two frequencies (50 Hz and 120 Hz)
% S = A1*sin(2*pi*f1*t) + A2*sin(2*pi*f2*t)
f1 = 50;  A1 = 0.7;
f2 = 120; A2 = 1.0;
S = A1*sin(2*pi*f1*t) + A2*sin(2*pi*f2*t);

% Add zero-mean random noise to the signal
rng('default'); % Set random seed for reproducibility
X = S + 2*randn(size(t));

% 3. Plot the original noisy signal in the time domain
figure;
subplot(2,1,1);
plot(1000*t(1:50), X(1:50)); % Plot first 50 samples
title('Signal Corrupted with Zero-Mean Random Noise');
xlabel('t (milliseconds)');
ylabel('X(t)');
grid on;

% 4. Compute the FFT
Y = fft(X);

% Compute the two-sided spectrum P2. Then compute the single-sided spectrum P1.
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1); % Multiply by 2 because P1 only has positive frequencies

% Define the frequency domain f
f = Fs*(0:(L/2))/L;

% 5. Plot the single-sided amplitude spectrum
subplot(2,1,2);
plot(f, P1);
title('Single-Sided Amplitude Spectrum of X(t)');
xlabel('f (Hz)');
ylabel('|P1(f)|');
grid on;

% The peaks should be around 50 Hz (amplitude ~0.7) and 120 Hz (amplitude ~1.0)
