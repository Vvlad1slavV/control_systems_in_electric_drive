clear
clc
path = "out/";
%% LINEAR
speed_pwm = importdata('SpeedPWM.txt');
speed_pwm(:, 1) = []; 

plot(speed_pwm)
%%
index_0 = speed_pwm<1.5;
index_1 = 260<speed_pwm & speed_pwm<320;
index_2 = 625<speed_pwm & speed_pwm<650;
index_3 = 970<speed_pwm & speed_pwm<1000;
index_4 = 1310<speed_pwm & speed_pwm<1345;
index_5 = 1655<speed_pwm & speed_pwm<1700;

speed_pwm_0 = speed_pwm(index_0);
speed_pwm_1 = speed_pwm(index_1);
speed_pwm_2 = speed_pwm(index_2);
speed_pwm_3 = speed_pwm(index_3);
speed_pwm_4 = speed_pwm(index_4);
speed_pwm_5 = speed_pwm(index_5);

speed_mean = [mean(speed_pwm_0), mean(speed_pwm_1), mean(speed_pwm_2), mean(speed_pwm_3), mean(speed_pwm_4), mean(speed_pwm_5)];


%%
current_pwm = importdata('current_pwm.txt');
current_pwm(:, 1) = [];
current_pwm_0 = current_pwm(index_0);
current_pwm_1 = current_pwm(index_1);
current_pwm_2 = current_pwm(index_2);
current_pwm_3 = current_pwm(index_3);
current_pwm_4 = current_pwm(index_4);
current_pwm_5 = current_pwm(index_5);

current_mean = [mean(current_pwm_0), mean(current_pwm_1), mean(current_pwm_2), mean(current_pwm_3), mean(current_pwm_4), mean(current_pwm_5)];

plot(current_pwm)
%%
u = 0:0.2:1;
u_intrp = 0:0.01:1;

speed_mean_intrp = interp1(u, speed_mean, u_intrp, 'pchip');
current_mean_intrp = interp1(u, current_mean, u_intrp, 'pchip');

% plot_xy_continuous_lable(u, speed_mean, "$U, V$", "$\omega(U), RPM$", true)
plot_xy_continuous_lable(u_intrp, speed_mean_intrp, "$U, V$", "$\omega(U), RPM$", true)
saveas(gcf, path+'task2_uv.png')

% plot_xy_continuous_lable(u, current_mean, "$U, V$", "$I, mA$", true)
plot_xy_continuous_lable(u_intrp, current_mean_intrp, "$U, V$", "$I, mA$", true)
saveas(gcf, path+'task2_ui.png')

plot_xy_continuous_lable(current_mean_intrp, speed_mean_intrp, "$I, mA$", "$\omega, RPM$", true)
saveas(gcf, path+'task2_iv.png')