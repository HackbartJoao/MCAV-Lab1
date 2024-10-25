% Section 1 Data
bz = 25500;
Jy = 1/300;
a = bz/Jy;
s = tf('s');
G = a/(s^2);

% Section 3

% 3.3 - PID Controller Root Locus

figure('Name', 'PID Control');
subplot(2,1,1)
kp = 1;
ki = 1;
kd = 1;

K = kp + (ki/s) + (kd*s);
L = K*G;
T = L/(1+L);
rlocus(L)
title('PID Controller Root Locus')
grid on;
pole(L)
zero(L)
% 3.3 - PID Controller Step Response
subplot(2,1,2)
t = 0:10^-10:0.00001;
step(T,t)
grid on;
title('PID Controller Step Response')


% 3.4 - Controller Comparison

K1 = kp/a;
L1 = K1*G;
T1 = L1/(1+L1);

K2 = (kd/a)*s;
L2 = K2*G;
T2 = L2/(1+L2);

K3 = kp + (ki/s) + (kd*s);
L3 = K3*G;
T3 = L3/(1+L3);

K4 = kp + (ki/s) + (kd*s);
L4 = K3*G;
T4 = L3/(1+L3);

figure('Name', 'Comparação Controladores');
[u,t] = gensig("square",10,20);

subplot(2,2,1);
lsim(T1,u,t)
title('Proporcional')
grid on

subplot(2,2,2);
lsim(T2,u,t)
title('Derivativo')
grid on

subplot(2,2,3);
lsim(T3,u,t)
title('Proporcional-Derivativo')
grid on

subplot(2,2,4);
lsim(T4,u,t)
title('Proporcional-Integral-Derivativo')
grid on