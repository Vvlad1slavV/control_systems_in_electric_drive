path = "out/";
config;
%% Theory
% state vector [M w_1]
% control vector [w_0 M_c]
A = [-1/Te          -betta/Te;
     1/(betta*Tm)   0];

B = [betta/Te   0;
     0          -1/(betta*Tm)];
C = eye(2);
D = zeros(2);

sys = ss(A,B,C,D);
%%
time = 0:0.0001:0.12;
u = [0.1*wnom*ones(size(time)); time*0];
y1 = lsim(sys, u, time);
M_1 = y1(:,1);
w1_1 = y1(:,2);

u = [time*0; 0.1*Mnom*ones(size(time))];
y2 = lsim(sys, u, time);
M_2 = y2(:,1);
w1_2 = y2(:,2);

%%
plot_step(time', w1_1, "$Time, s$", "$\omega_1(t)$", true)
saveas(gcf, path+'task11_omega1.png')
plot_xy_continuous_lable(time, M_1, "$Time, s$", "$M(t)$", true)
saveas(gcf, path+'task11_M.png')

plot_step(time', M_2, "$Time, s$", "$M(t)$", true)
saveas(gcf, path+'task12_M.png')
plot_xy_continuous_lable(time, w1_2, "$Time, s$", "$\omega_1(t)$", true)
saveas(gcf, path+'task12_omega1.png')

close all