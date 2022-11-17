% Variant 1
J1 = 0.0077;
J2 = 0.0023;
C12 = 444;
Mnom = 7.16;
wnom = 116.6;
Mp = 70;
Te = 3.3/1000;
Tpr = 0.5/1000;
Kpr = 10;
Mc1 = 4.77;
Mc2 = 2.39;

gamma = (J1+J2)/J1;
w0 = sqrt((C12*(J1+J2))/(J1*J2));
wc1 = w0/sqrt(gamma);
wc2 = w0;

betta = Mp/wnom;
J=J1+J2;
Tm = J/betta;



