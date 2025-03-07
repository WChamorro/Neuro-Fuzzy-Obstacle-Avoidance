function result = Case_2_R(odp, theta_d)
v_max= 1;
v_min=0.3;
LMr=381e-3;
R=195e-3;

Lt_max=1.2;
Lt_min=0.3;
v_mean=(v_max+v_min)/2;

if theta_d == 0
    theta_d = -0.001;
end

S = -1;
factor = round(gain_near_extremes_normalized(odp), 4);
Lt_p = round(((odp) * (Lt_max - Lt_min) + Lt_min), 4);
V_p = round(v_max - (factor * (v_mean / 2)), 4);

if odp < 0.2 && theta_d > -0.5 && theta_d < 0
    fth = round(gain_near_zero(-1 * theta_d), 4);
    theta_d = fth * -pi;
else
    theta_d = theta_d;
end

cf = pi / 4;
result = round((1 + ((LMr * (theta_d + cf) * S) / (2 * Lt_p))) * (V_p / R), 4);
end