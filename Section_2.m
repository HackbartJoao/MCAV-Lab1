% Section 1
bz = 25500;
Jy = 1/300;
a = bz/Jy;
s = tf('s');
G = a/(s^2);

% Section 2
k_theta=1;

% 2.1 - Proportional Controller Root Locus
figure('Name', 'Proportional Control');
subplot(2,1,1);
K1 = k_theta/a;
L1 = K1*G;
T1 = L1/(1+L1);
rlocus(L1)
title('Proportional Controller Root Locus')
grid on;
pole(L1)
zero(L1)
% 2.2 - Proportional Controller Step Response - Marginally stable
subplot(2,1,2);
t = 0:0.01:10;
step(T1,t);
grid on;
title('Proportional Controller Step Response')

% 2.3 - Derivative Controller Root Locus
figure('Name', 'Derivative Control');
subplot(2,1,1)
K2 = (k_theta/a)*s;
L2 = K2*G;
T2 = L2/(1+L2);
rlocus(L2)
title('Derivative Controller Root Locus')
grid on;
pole(L2)
zero(L2)
% 2.4 - Derivative Controller Step Response
subplot(2,1,2)
t = 0:0.01:5;
step(T2,t);
grid on;
title('Derivative Controller Step Response')

% 2.5 - PD Controller Root Locus
figure('Name', 'PD Control');
subplot(2,1,1)
kp = 1;
kd = 1;

K3 = kp + (kd*s);
L3 = K3*G;
T3 = L3/(1+L3);
rlocus(L3)
title('PD Controller Root Locus')
grid on;
pole(L3)
zero(L3)
% 2.5 - PD Controller Step Response
subplot(2,1,2)
t = 0:10^-10:0.00001;
step(T3,t)
grid on;
title('PD Controller Step Response')




