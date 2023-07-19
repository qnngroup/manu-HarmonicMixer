# manu-HarmonicMixer

Files:
1. Degenerate1690.csv is the sampling of the 10-cycle pulse with itself (time (fs), deltaI (a.u.))
2. FN_crossCorrelation.m is the script used for sampling simulations where pulse 1 is the signal pulse and pulse 2 is the gate pulse.
3. FN_freq_BW.m is the script used for generating the theoretical frequency response based on the Fowler-Nordheim equation using an aysmmetric device architecture
4. J_FN_SI_Asym.m is the function which is the full Fowler-Nordheim equation (simplified when v_f=1)
5. LongGateSCG.csv is the experimental data using the 10-cycle gate pulse to sample the 1.5-cycle supercontinuum (time (fs), deltaI (a.u.))
6. Nondegenerate_f_2f.csv is the experimental data using the 10-cycle gate pulse (f) to measure its second harmonic (2f) (time (fs), deltaI (a.u.))
7. ShortGateSCG.csv is the experimental data using the 1.5-cycle pulse to measure itself (time (fs), deltaI (a.u.))
8. Spectrometer1690.csv is the 1690 nm gate pulse measured on an InGaAs grating-based spectrometer (wavelength (nm), intensity (a.u.)
9. SpectrometerSCG.csv is the supercontinuum measured on an InGaAs grating-based spectrometer  (wavelength (nm), intensity (a.u.)
10. SpectrometerSHG.csv is the second harmonic of the 1690 nm gate pulse measured on a Si grating-based spectrometer  (wavelength (nm), intensity (a.u.)
11. dJ_FN_SI_Asym.m is the function which is the derivative of the Fowler-Nordheim equation (simplified when v_f=1)
12. exp_cross_correlation.m is a script which two datasets are input (time (fs), deltaI (a.u.)). The way it is setup may require one to ensure the data vectors are even (e.g. time/deltaI vector should contain 100 data points rather than 99)
13. fft.m the functino used for performing a Fourier Fast Transform
14. gaussianPulseHOD.m is a function to generate a Gaussian pulse with up to 4th order dispersion. The dispersion is added by ffting into frequency and multiplying, then inverse FFT to obtain the time-domain fields

To reproduce figure 1 use the following: FDTD of the nanoantenna, example simulation code is provided, https://github.com/qnngroup/pymeep-nanoantenna-simulator
To reproduce figure 2, use File 14 (gaussianPulseHOD.m) with varied CEP and use File 4 (J_FN_SI_Asym.m) to obtain the electron emission rate. To obtain the frequency bandwidths, use File 3 (FN_freq_BW.m). To see the expected cross-correlation given a gate pulse + signal pulse with varied CEP, use File 2 (FN_crossCorrelation.m) and change the parameters of the pulse to the desired CEP/cycle count/center wavelengths
To reproduce figure 3, use File 1 (time domain field datafile) and File 13 (fft.m). To obtain the theoretical frequency response H(omega) use File 3 (FN_freq_BW.m)
To reproduce figure 4, use File 6 (time domain field datafile) and File 13 (fft.m). To obtain the theoretical frequency response H(omega) use File 3 (FN_freq_BW.m)
To reproduce figure 5, use Files 7 and 5 (time domain fields) and File 13 (fft.m). To obtain the theoretical frequency response H(omega) use File 3 (FN_freq_BW.m) For the simulated current crosscorrelation, use exp_cross_correlation.m and input the gate pulse (File 1, Degenerate1690.csv) and signal pulse (File 7. ShortGateSCG.csv) at the top of the script. The output is the variable "time' and "total"
