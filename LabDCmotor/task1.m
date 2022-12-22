clear
clc
path = "out/";
%% LINEAR
speed_linear_T = readtable('speed.csv');
speed_linear = table2array(speed_linear_T);
speed_linear(:, 1) = [];

index_1 = 680:1:740;
index_2 = 1930:1:1995;
index_3 = 2560:1:2610;
index_4 = 3288:1:3340;
index_5 = 4375:1:4430;

speed_linear_1 = speed_linear(index_1);
speed_linear_2 = speed_linear(index_2);
speed_linear_3 = speed_linear(index_3);
speed_linear_4 = speed_linear(index_4);
speed_linear_5 = speed_linear(index_5);

speed_mean = [mean(speed_linear_1), mean(speed_linear_2), mean(speed_linear_3), mean(speed_linear_4), mean(speed_linear_5)];

plot(speed_linear)
%%
current_linear = importdata('current.txt');
current_linear(:, 1) = [];

current_linear_1 = current_linear(index_1);
current_linear_2 = current_linear(index_2);
current_linear_3 = current_linear(index_3);
current_linear_4 = current_linear(index_4);
current_linear_5 = current_linear(index_5);

current_mean = [mean(current_linear_1), mean(current_linear_2), mean(current_linear_3), mean(current_linear_4), mean(current_linear_5)];

plot(current_linear)
%%
u = 0:0.2:1;
u_intrp = 0:0.01:1;

speed_mean_intrp = interp1(u, speed_mean, u_intrp, 'pchip');
current_mean_intrp = interp1(u, current_mean, u_intrp, 'pchip');

% plot_xy_continuous_lable(u, speed_mean, "$U, V$", "$\omega(U), RPM$", true)
plot_xy_continuous_lable(u_intrp, speed_mean_intrp, "$U, V$", "$\omega(U), RPM$", true)
saveas(gcf, path+'task1_uv.png')

% plot_xy_continuous_lable(u, current_mean, "$U, V$", "$I, mA$", true)
plot_xy_continuous_lable(u_intrp, current_mean_intrp, "$U, V$", "$I, mA$", true)
saveas(gcf, path+'task1_ui.png')

plot_xy_continuous_lable(current_mean_intrp, speed_mean_intrp, "$I, mA$", "$\omega, RPM$", true)
saveas(gcf, path+'task1_iv.png')

%% Save model as pdf
print('-smodel_print', '-dpdf', 'out/model')