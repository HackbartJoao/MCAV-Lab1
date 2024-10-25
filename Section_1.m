% 1.1 - Define the constants
bz = 2.55*10^-5;
Jy = 1/300;
a = bz/Jy;

% 1.2 - Create the transfer function
s = tf('s');
G = a/(s^2);

% 1.3 - Draw the Bode diagram
figure(1);
bode(G);
grid on;

% 1.4 - Two poles on origin, system unstable

% 1.5 - Perform step response analysis
figure(2);
t = 0:0.01:2;
step(G,t);
grid on;



