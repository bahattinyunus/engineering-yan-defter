import numpy as np
import matplotlib.pyplot as plt

def generate_signal(freq, sample_rate, duration):
    t = np.linspace(0, duration, int(sample_rate * duration), endpoint=False)
    signal = np.sin(2 * np.pi * freq * t)
    return t, signal

def plot_spectrum(signal, sample_rate):
    fft_result = np.fft.fft(signal)
    freqs = np.fft.fftfreq(len(signal), 1/sample_rate)
    
    # Plotting
    plt.figure(figsize=(10, 6))
    plt.plot(freqs[:len(freqs)//2], np.abs(fft_result)[:len(freqs)//2])
    plt.title("RF Spectrum Analysis")
    plt.xlabel("Frequency (Hz)")
    plt.ylabel("Magnitude")
    plt.grid(True)
    plt.show()

if __name__ == "__main__":
    fs = 10000  # Sample rate
    f_signal = 1200 # Signal frequency
    
    t, sig = generate_signal(f_signal, fs, 1.0)
    
    # Add some noise
    noise = np.random.normal(0, 0.5, sig.shape)
    noisy_sig = sig + noise
    
    plot_spectrum(noisy_sig, fs)
