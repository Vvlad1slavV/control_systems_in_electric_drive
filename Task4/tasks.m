save_path = "out/";
config;
%% 
Mc = 0;
TIME = 0.12;

ELMEX = 0;
sim_out = sim("model.slx", TIME);

time = sim_out.tout;
w = sim_out.logsout.get("w1").Values.Data;
w_opt = sim_out.logsout.get("w_opt").Values.Data;
uy = sim_out.logsout.get("Uy").Values.Data;
e_omega = w_opt-w;

plot_xy_continuous_lable(time, uy, "$Time, s$", "$u(t)$", true)
saveas(gcf, save_path+'task1_u.png')
plot_M_and_Mopt(time, w, w_opt, "$Time, s$", "$\omega(t)$", {'$\omega$','$\omega_{opt}$'}, true)
saveas(gcf, save_path+'task1_omega.png')
plot_xy_continuous_lable(time, e_omega, "$Time, s$", "$e(t)$", true)
saveas(gcf, save_path+'task1_e.png')
close all

%%
Mc = Mc2;
w_zad = 0;
TIME = 0.2;

sim_out = sim("model.slx", TIME);

time = sim_out.tout;
w = sim_out.logsout.get("w1").Values.Data;
% w_opt = sim_out.logsout.get("w_opt").Values.Data;
w_opt = -(T1 - Tmu)*2*Tmu*Mc/betta/(T1^2 - 2*T1*Tmu + 2*Tmu^2)*(exp(-time/T1) - exp(-time/2/Tmu).*(cos(time/2/Tmu) - Tmu/(T1 - Tmu)*sin(time/2/Tmu)));
uy = sim_out.logsout.get("Uy").Values.Data;
e_omega = w_opt-w;


plot_step(time, uy, "$Time, s$", "$u(t)$", true)
saveas(gcf, save_path+'task2_u.png')
plot_M_and_Mopt(time, w, w_opt, "$Time, s$", "$\omega(t)$", {'$\omega$','$\omega_{opt}$'}, true)
saveas(gcf, save_path+'task2_omega.png')
plot_xy_continuous_lable(time, e_omega, "$Time, s$", "$e(t)$", true)
saveas(gcf, save_path+'task2_e.png')
close all

disp(['динамический выброс скорости ', num2str(min(w))])
disp(['расчетный динамический выброс скорости ', num2str(min(w_opt))])
%% Save model as pdf
print('-smodel_print', '-dpdf', 'out/model')
