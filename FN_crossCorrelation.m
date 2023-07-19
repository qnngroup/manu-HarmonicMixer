% Time interval
dt = 0.01;  % Time step
tmax = 500; % Max time
t = -tmax:dt:tmax; % Time axis
% Pulse 1 - signal
yc1=1.76/1; %center wavelength in micron
c=2.99792458e8 ;
cycle_count1 = yc1 * (1e-6) / (c * 1e-15);
w1=2*pi*c*1e-15./(yc1*1e-6);
fwhm_1 = cycle_count1*1.5;   % cycle count of signal
phi_ce_1 = 0;  % Carrier-envelope phase of pulse 1
GDD1=0;
TOD1=0;
FOD1=0;
pulse_1 =gaussianPulseHOD(t,fwhm_1,w1,phi_ce_1,GDD1,TOD1,FOD1);

% Pulse 2 - gate
yc2=1.69/1; %center wavelength in micron
cycle_count2 = yc2 * (1e-6) / (c * 1e-15);
w2=2*pi*c*1e-15./(yc2*1e-6);
fwhm_2 = cycle_count2*10;   % cycle count of gate
phi_ce_2 = 0; % Carrier-envelope phase of pulse 2
GDD2=0;
TOD2=0;
FOD2=0;
pulse_2 = gaussianPulseHOD(t,fwhm_2,w2,phi_ce_2,GDD2,TOD2,FOD2);

% Cross-correlation loop
tau_range = -300:0.5:300; % Delay range
J_corr = zeros(size(tau_range));
workfunction=5.1;%workfunction of gold
ratio=1e-3;%ratio of signal to gate
test=zeros(1,length(tau_range));
for k = 1:length(tau_range)
    % Shift gate by a time delay (tau)
    pulse_2_shifted = interp1(t, pulse_2, t-tau_range(k), 'linear', 0);
    J_corr(k)=sum(J_FN_SI_Asym(pulse_2_shifted*32+pulse_1*ratio,workfunction));
end
J_corr1=J_corr-J_corr(100);
