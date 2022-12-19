save_path = "out/";
config;
%% Без обратной связи
TIME = 0.02;

ELMEX = 0;
sim_out = sim("model.slx", TIME);

time = sim_out.tout;
M = sim_out.logsout.get("M").Values.Data;
M_opt = sim_out.logsout.get("M_opt").Values.Data;
uy = sim_out.logsout.get("Uy").Values.Data;
e_M = M_opt-M;

plot_xy_continuous_lable(time, uy, "$Time, s$", "$u(t)$", true)
saveas(gcf, save_path+'task1_u.png')
plot_M_and_Mopt(time, M, M_opt, "$Time, s$", "$M(t)$", {'$M$','$M_{opt}$'}, true)
saveas(gcf, save_path+'task1_M.png')
plot_xy_continuous_lable(time, e_M, "$Time, s$", "$e(t)$", true)
saveas(gcf, save_path+'task1_e.png')
close all

%% С обратной связью
TIME = 0.02;

ELMEX = 1;
sim_out = sim("model.slx", TIME);

time = sim_out.tout;
M = sim_out.logsout.get("M").Values.Data;
M_opt = sim_out.logsout.get("M_opt").Values.Data;
uy = sim_out.logsout.get("Uy").Values.Data;
e_M = M_opt-M;

plot_xy_continuous_lable(time, uy, "$Time, s$", "$u(t)$", true)
saveas(gcf, save_path+'task2_u.png')
plot_M_and_Mopt(time, M, M_opt, "$Time, s$", "$M(t)$", {'$M$','$M_{opt}$'}, true)
saveas(gcf, save_path+'task2_M.png')
plot_xy_continuous_lable(time, e_M, "$Time, s$", "$e(t)$", true)
saveas(gcf, save_path+'task2_e.png')
close all

