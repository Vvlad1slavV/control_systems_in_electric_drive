path = "out/";
config;
%% Theory
% state vector [M w_1]
% control vector [w_0 M_c]
A = [-1/Te -betta/Te 0      0;
     1/J1   0        -1/J1   0;
     0      C12      0      -C12
     0      0       1/J2    0];

B = [betta/Te   0       0;
     0         -1/J1   0;
     0          0       0;
     0          0      -1/J2];
C = eye(4);
D = zeros(4,3);

sys = ss(A,B,C,D);
%% Modeling
time1 = 0:0.001:0.2;
u = [0.1*wnom*ones(size(time1)); time1*0; time1*0];
y1 = lsim(sys, u, time1);
M_1 = y1(:,1);
w1_1 = y1(:,2);
M12_1 = y1(:,3);
w2_1 = y1(:,4);

time2 = 0:0.001:0.4;
u = [time2*0; time2*0; 0.1*Mnom*ones(size(time2))];
y2 = lsim(sys, u, time2);
M_2 = y2(:,1);
w1_2 = y2(:,2);
M12_2 = y2(:,3);
w2_2 = y2(:,4);


plot_xy_continuous_lable(time1, M_1, "$Time, s$", "$M(t)$", true)
saveas(gcf, path+'task21_M.png')
plot_xy_continuous_lable(time1, M12_1, "$Time, s$", "$M_{12}(t)$", true)
saveas(gcf, path+'task21_M12.png')
plot_xy_continuous_lable(time1, w1_1, "$Time, s$", "$\omega_1(t)$", true)
saveas(gcf, path+'task21_omega1.png')
plot_xy_continuous_lable(time1, w2_1, "$Time, s$", "$\omega_2(t)$", true)
saveas(gcf, path+'task21_omega2.png')

plot_xy_continuous_lable(time2, M_2, "$Time, s$", "$M(t)$", true)
saveas(gcf, path+'task22_M.png')
plot_xy_continuous_lable(time2, M12_2, "$Time, s$", "$M_{12}(t)$", true)
saveas(gcf, path+'task22_M12.png')
plot_xy_continuous_lable(time2, w1_2, "$Time, s$", "$\omega_1(t)$", true)
saveas(gcf, path+'task22_omega1.png')
plot_xy_continuous_lable(time2, w2_2, "$Time, s$", "$\omega_2(t)$", true)
saveas(gcf, path+'task22_omega2.png')
close all
