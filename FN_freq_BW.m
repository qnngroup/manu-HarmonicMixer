yc=1.69;
c=2.99792458e8 ;
wc=2*pi*c*1e-15./(yc*1e-6);
t=linspace(-100,100,50000);
cycle_count = yc * (1e-6) / (c * 1e-15);
fwhm=cycle_count*10;
phi_ce=0;
GDD=0;
TOD=0;
FOD=0;
pulse=gaussianPulseHOD(t,fwhm,wc,phi_ce,GDD,TOD,FOD);
FN=J_FN_SI_Asym(pulse*32,5.1);

plot(t,FN)
[f,Af]=fftout(t,FN);
nAf=Af./max(Af)';
f=f';
plot(f,nAf) 
axis([0 2 0 1])