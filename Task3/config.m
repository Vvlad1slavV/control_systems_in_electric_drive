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

betta = Mp/wnom;
J=J1+J2;
%%
u_zad = 10;

Km = u_zad/Mnom;
Tmu = Tpr;
Ti = Te;
Kp = Te/(2*Tpr*Kpr*Km*betta);

ELMEX = 0;