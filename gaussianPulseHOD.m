function out=gaussianPulseHOD(t,fwhm,wc,phi_ce,GDD,TOD,FOD)


tau = fwhm/(2*sqrt(log(2)));
E_envelope=exp(-t.^2/(2*tau.^2));

%E=E_envelope.*cos(wc*t+phi_ce);
%plot(t,E./max(E),t,E_envelope./max(E_envelope))
%fwhm in fs
%wc = 2*np.pi*c*1e-15/(yc*1e-6)
E_envelope_f=fft(E_envelope);
N=numel(t);
T=abs(min(t))+max(t);
dt=1*T/N;


w=2*pi*fftfreq(numel(E_envelope),dt);

%plot(fftshift(w+wc),fftshift(abs((E_envelope_f)).^2))






HOD=exp(-1i* ( (GDD*w.^2*(1/2))+ (TOD*w.^3*(1/6)) + (FOD*w.^4*(1/24))));

E_HOD=ifft(E_envelope_f.*HOD);
%plot(t,abs(E_envelope).^2,t,(abs(E_HOD).^2)./max((abs(E_HOD).^2)))
%out=((abs(E_HOD).^2)./max((abs(E_HOD).^2)));
out = E_HOD.*cos(wc.*t + phi_ce);%cos(wc.*t + phi_ce); %exp(1i*wc*t+phi_ce)
%xlim([-10*fwhm 10*fwhm])
%out = E_HOD.*exp(1i*wc*t);

%plot(abs(E_HOD).^2)



end

