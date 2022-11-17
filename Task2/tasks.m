path = "out2";
config;
%% Theory

%% Modeling
TIME = 0.2;
sim_out = sim("model2.slx", TIME);

time = sim_out.tout;
w1 = squeeze(sim_out.logsout.get("w1").Values.Data);
w2 = squeeze(sim_out.logsout.get("w2").Values.Data);
M12 = squeeze(sim_out.logsout.get("M12").Values.Data);