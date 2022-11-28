path = "out/";
config;
%% Theory
M1 = 0.1*Mnom;

%% Modeling
TIME = 0.2;
sim_out = sim("model1.slx", TIME);

time = sim_out.tout;
w1 = squeeze(sim_out.logsout.get("w1").Values.Data);
w2 = squeeze(sim_out.logsout.get("w2").Values.Data);
M12 = squeeze(sim_out.logsout.get("M12").Values.Data);

w1t = eps_avg*time + J2/J1*eps_avg/Omega12*sin(Omega12*time);
w2t = eps_avg*time - eps_avg/Omega12*sin(Omega12*time);
M12t = J2*(eps_avg - eps_avg*cos(Omega12*time));
%%
plot_task1(time, w1, w1t, "$Time, s$", "$\omega_1(t)$",{'$\omega_1$','$\omega_{1t}$'}, true)
saveas(gcf, path+'task1_omega1.png')
plot_task1(time, w2, w2t, "$Time, s$", "$\omega_2(t)$",{'$\omega_2$','$\omega_{2t}$'}, true)
saveas(gcf, path+'task1_omega2.png')
plot_task1(time, M12, M12t, "$Time, s$", "$\omega_2(t)$",{'$M_{12}$','$M_{12t}$'}, true)
saveas(gcf, path+'task1_M12.png')

close all
%%
mdl = 'model1';
% open_system(mdl);
io(1) = linio('model1/Step M',1,'input');
io(2) = linio('model1/Transfer Fcn omega1',1,'output');
io(3) = linio('model1/Transfer Fcn omega2',1,'output');
linsys = linearize(mdl,io);
w = 1:1:1000;
[mag,phase,wout] = bode(linsys, w);
mag = squeeze(mag);
mag_db = mag2db(mag);
phase = squeeze(phase);
% plot(wout, mag2db(mag))

%%
plot_task1bode(wout, mag_db(1,:), phase(1,:), "$\omega, rad/s$", "Magnitude (dB)", "Phase (deg)", true)
saveas(gcf, path+'task1_omega1bode.png')
plot_task1bode(wout, mag_db(2,:), phase(2,:), "$\omega, rad/s$", "Magnitude (dB)", "Phase (deg)", true)
saveas(gcf, path+'task1_omega2bode.png')

close all
