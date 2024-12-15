
clear;

%%Robustness Test Coefficient
rbc = get_param('LIVA_AUV_SIMULATOR/robustcoefficient','Value');
if rbc == '0'
    pk = 1;
else 
    pk = 1.3;
end

%%Controller sample time
Ts_controller = 0.001;

%%Mass & Inertias
m = 11.5*pk;
Ix = 0.16*pk;
Iy = 0.16*pk;
Iz = 0.16*pk;

%%Added Mass & Rigid Body Mass Parameters
Xudot=10.6505*pk;
Yvdot=11.9247*pk;
Zwdot=11.9247*pk;
Kpdot=0*pk;
Mqdot=0.0023*pk;
Nrdot=0.0023*pk;

%%Gravity Center
xg = 0;
yg = 0;
zg = 0.02;

%%Buoyancy Center
xb = 0;
yb = 0;
zb = 0;

%%Linear Damping
Xu = 26*pk;
Yv = 30*pk;
Zw = 59*pk;
Kp = 11.7*pk;
Mq = 15*pk;
Nr = 30*pk;

%%Quadratic Damping
Xuu = 18.18*pk;
Yvv = 21.66*pk;
Zww = 36.99*pk;
Kpp = 1.55*pk;
Mqq = 1.55*pk;
Nrr = 1.55*pk;

%%Gravity & Buoyancy Forces
W = 112.8*pk;
B = 114.8*pk;

%%Thruster Limit
Tmax = 40; %Newton

%%i-PID Coefficient
alfa = 1.1;

%%Observer Coefficient
Kc = 20*eye(6);

%% Hybrid Controller Parameters (Found by performing constrained optimization using simulink opt. toolbox, "fmincon")
Hybrid_xKp = 0.076855911654313547;
Hybrid_xalfa = 5.092878318451735;
Hybrid_xKi = 2.7844771490230995;
Hybrid_xKd = 0.22268044710682114;
Hybrid_xbeta = 0.024498184986623803;

Hybrid_yKp = 1.1702594243169564;
Hybrid_yalfa = -0.12109096963388193;
Hybrid_yKi = 4;
Hybrid_yKd = 3.2204529512582094;
Hybrid_ybeta = 0.14753195815811565;

Hybrid_zKp = 3;
Hybrid_zalfa = 0.000093192131906777681;
Hybrid_zKi = 4;
Hybrid_zKd = 2.3942637207502;
Hybrid_zbeta = -0.097689788118772547;

Hybrid_rKp = 3;
Hybrid_rKi = 2;
Hybrid_rKd = -0.0819081975805605;

Hybrid_pKp = -0.090719625433908213;
Hybrid_pKi = 1.205379541632126;
Hybrid_pKd = 1.9282219311449538;

Hybrid_ywKp = 1.9547800678980167;
Hybrid_ywKi = 2;
Hybrid_ywKd = 0.001820978970578287;

%% 2DoF i-PID Controller Parameters
twodof_xKp = 0.28411216909151349;
twodof_xalfa = 0.30234710594262;
twodof_xKi = 3.9943078181304963;
twodof_xKd = 0.97271920084965735;
twodof_xbeta = 1.7366690704427536;

twodof_yKp = 0.063666271676642031;
twodof_yalfa = 0.10435250246875363;
twodof_yKi = 3.9999790377213498;
twodof_yKd = 0.18997113533365648;
twodof_ybeta = 0.005650227565256156;

twodof_zKp = 2.9999790377213507;
twodof_zalfa = 0.00008034865340691478;
twodof_zKi = 3.8840765857077431;
twodof_zKd = 2.2289396936947683;
twodof_zbeta = 0.32801506093302246;

twodof_rKp = 2.9999790377213507;
twodof_ralfa = 0.19999999999999798;
twodof_rKi = 1.1506401605012322;
twodof_rKd = 0.53578437965746184;
twodof_rbeta = 0.20000000000000065;

twodof_pKp = 0.11369893762575015;
twodof_palfa = 0.25;
twodof_pKi = 0.13825854798036114;
twodof_pKd = 0.095424714936744218;
twodof_pbeta = 0.12;

twodof_ywKp = 0.28527888951964514;
twodof_ywalfa = -4.2798991350061177;
twodof_ywKi = 0.00008440390384513819;
twodof_ywKd = 1.0659867557210738;
twodof_ywbeta = 0.35373480857737255;

%% i-PID Controller Parameters

iPID_xKp = 0.018002365678869262;
iPID_xKi = 1.1219546659293831;
iPID_xKd = 0;

iPID_yKp = 3;
iPID_yKi = 0.13401348623396903;
iPID_yKd = 3.4277809029094881E-18;

iPID_zKp = 0.26825539985723995;
iPID_zKi = 3.5484685597653076;
iPID_zKd = 0.00075053756185264819;

iPID_rKp = 3;
iPID_rKi = 9.65529148649622E-19;
iPID_rKd = 2;

iPID_pKp = 0;
iPID_pKi = 0.031254576821627369;
iPID_pKd = 0.00013750228463629022;

iPID_ywKp = 0.87058892280816969;
iPID_ywKi = 2;
iPID_ywKd = 0.62280020767048139;

%% PID Controller Parameters


PID_xKp = 3;
PID_xKi = 4;
PID_xKd = 4;

PID_yKp = 3;
PID_yKi = 4;
PID_yKd = 3.1154066328676535;

PID_zKp = 3;
PID_zKi = 4;
PID_zKd = 0.01813689620732389;

PID_rKp = -0.040345732248197354;
PID_rKi = 0.001;
PID_rKd = -0.054985573360707168;

PID_pKp = -0.39327079611315297;
PID_pKi = 2;
PID_pKd = -0.04940918869876651;

PID_ywKp = 0.98566932171151178;
PID_ywKi = -0.006253695766722793;
PID_ywKd = 0.89665765450717427;












