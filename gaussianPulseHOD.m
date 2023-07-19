function out=gaussianPulseHOD(t,fwhm,wc,phi_ce,GDD,TOD,FOD)
tau = fwhm/(2*sqrt(log(2)));
E_envelope=exp(-t.^2/(2*tau.^2));
E_envelope_f=fft(E_envelope);
N=numel(t);
T=abs(min(t))+max(t);
dt=1*T/N;
w=2*pi*fftfreq(numel(E_envelope),dt);
HOD=exp(-1i* ( (GDD*w.^2*(1/2))+ (TOD*w.^3*(1/6)) + (FOD*w.^4*(1/24))));
E_HOD=ifft(E_envelope_f.*HOD);
out = E_HOD.*cos(wc.*t + phi_ce);
end

