% Variant 1
wnom = 116.6;
Mnom = 7.16;
Mp = 70;
J1 = 0.0077;
J2 = 0.0023;
C12 = 444;
Te = 3.3/1000;
Tpr = 0.5/1000;
Kpr = 10;
Mc1 = 4.77;
Mc2 = 2.39;

%%
betta = Mp/wnom;
J=J1+J2;
Tm = J/betta;
%%
u_zad = 10;
w_zad = wnom;
Kw = u_zad/wnom;

T12 = -roots([Te*Tm Tm 1]);
T2 = 1/T12(1);
T1 = 1/T12(2);

Tmu = Tpr + T2;
Ti = T1;
Kp = T1/(2*Tmu*Kpr*Kw);
Mc = 0;
