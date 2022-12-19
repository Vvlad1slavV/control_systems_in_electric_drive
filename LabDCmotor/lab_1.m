clear
clc
%% LINEAR
speed_linear_T = readtable('speed.csv');
speed_linear = table2array(speed_linear_T);
speed_linear_0 = speed_linear(1:251,:);
speed_linear_1 = speed_linear(252:750,:);
speed_linear_2 = speed_linear(751:1251,:);
speed_linear_3 = speed_linear(1252:1750,:);
speed_linear_4 = speed_linear(1751:2251,:);
speed_linear_5 = speed_linear(2252:2750,:);
speed_linear_6 = speed_linear(2751:3251,:);
speed_linear_7 = speed_linear(3252:3750,:);
speed_linear_8 = speed_linear(3751:4251,:); 
speed_linear_9 = speed_linear(4252:4750,:);
speed_linear_10 = speed_linear(4751:4887,:);
%%
current_linear = importdata('current.txt');
current_linear_0 = current_linear(1:251,:);
current_linear_1 = current_linear(252:750,:);
current_linear_2 = current_linear(751:1251,:);
current_linear_3 = current_linear(1252:1750,:);
current_linear_4 = current_linear(1751:2251,:);
current_linear_5 = current_linear(2252:2750,:);
current_linear_6 = current_linear(2751:3251,:);
current_linear_7 = current_linear(3252:3750,:);
current_linear_8 = current_linear(3751:4251,:); 
current_linear_9 = current_linear(4252:4750,:);
current_linear_10 = current_linear(4751:4887,:);
%%
t = 0:0.0020463:10;
plot(t,speed_linear(:,2))
%%
plot(t,current_linear(:,2))
%%
hold on
plot(current_linear_1(:,2),speed_linear_1(:,2))
plot(current_linear_2(:,2),speed_linear_2(:,2))
plot(current_linear_3(:,2),speed_linear_3(:,2))
plot(current_linear_4(:,2),speed_linear_4(:,2))
plot(current_linear_5(:,2),speed_linear_5(:,2))
plot(current_linear_6(:,2),speed_linear_6(:,2))
plot(current_linear_7(:,2),speed_linear_7(:,2))
plot(current_linear_8(:,2),speed_linear_8(:,2))
plot(current_linear_9(:,2),speed_linear_9(:,2))
plot(current_linear_10(:,2),speed_linear_10(:,2))
hold off
%%
current_mean = [mean(current_linear_0(:,2)), mean(current_linear_1(:,2)), mean(current_linear_2(:,2)), mean(current_linear_3(:,2)), mean(current_linear_4(:,2)), mean(current_linear_5(:,2)), mean(current_linear_6(:,2)),mean(current_linear_7(:,2)), mean(current_linear_8(:,2)), mean(current_linear_9(:,2)), mean(current_linear_10(:,2))];
speed_mean = [mean(speed_linear_0(:,2)), mean(speed_linear_1(:,2)), mean(speed_linear_2(:,2)), mean(speed_linear_3(:,2)), mean(speed_linear_4(:,2)), mean(speed_linear_5(:,2)), mean(speed_linear_6(:,2)),mean(speed_linear_7(:,2)), mean(speed_linear_8(:,2)), mean(speed_linear_9(:,2)), mean(speed_linear_10(:,2))];
plot(current_mean, speed_mean)
%% PWM
speed_pwm = importdata('speed_pwm.txt');
current_pwm = importdata('current_pwm.txt');
%%
t_pwm = 0:0.00204878:10;
plot(t_pwm,speed_pwm(:,2))
%%
plot(t_pwm,current_pwm(:,2))
%%
speed_pwm_0 = speed_pwm(1:251,:);
speed_pwm_1 = speed_pwm(252:750,:);
speed_pwm_2 = speed_pwm(751:1251,:);
speed_pwm_3 = speed_pwm(1252:1750,:);
speed_pwm_4 = speed_pwm(1751:2251,:);
speed_pwm_5 = speed_pwm(2252:2750,:);
speed_pwm_6 = speed_pwm(2751:3251,:);
speed_pwm_7 = speed_pwm(3252:3750,:);
speed_pwm_8 = speed_pwm(3751:4251,:); 
speed_pwm_9 = speed_pwm(4252:4750,:);
speed_pwm_10 = speed_pwm(4751:4881,:);
%%
current_pwm_0 = current_pwm(1:251,:);
current_pwm_1 = current_pwm(252:750,:);
current_pwm_2 = current_pwm(751:1251,:);
current_pwm_3 = current_pwm(1252:1750,:);
current_pwm_4 = current_pwm(1751:2251,:);
current_pwm_5 = current_pwm(2252:2750,:);
current_pwm_6 = current_pwm(2751:3251,:);
current_pwm_7 = current_pwm(3252:3750,:);
current_pwm_8 = current_pwm(3751:4251,:); 
current_pwm_9 = current_pwm(4252:4750,:);
current_pwm_10 = current_pwm(4751:4881,:);
%%
current_mean_pwm = [mean(current_pwm_0(:,2)), mean(current_pwm_1(:,2)), mean(current_pwm_2(:,2)), mean(current_pwm_3(:,2)), mean(current_pwm_4(:,2)), mean(current_pwm_5(:,2)), mean(current_pwm_6(:,2)),mean(current_pwm_7(:,2)), mean(current_pwm_8(:,2)), mean(current_pwm_9(:,2)), mean(current_pwm_10(:,2))];
speed_mean_pwm = [mean(speed_pwm_0(:,2)), mean(speed_pwm_1(:,2)), mean(speed_pwm_2(:,2)), mean(speed_pwm_3(:,2)), mean(speed_pwm_4(:,2)), mean(speed_pwm_5(:,2)), mean(speed_pwm_6(:,2)),mean(speed_pwm_7(:,2)), mean(speed_pwm_8(:,2)), mean(speed_pwm_9(:,2)), mean(speed_pwm_10(:,2))];
plot(current_mean_pwm,speed_mean_pwm)