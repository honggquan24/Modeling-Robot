clear
syms theta1 theta2 theta3 theta4 theta5 theta6

            T1 = [[cos(theta1)      0       sin(theta1)     320 * cos(theta1)]
                  [sin(theta1)      0       -cos(theta1)    320 * sin(theta1)]
                  [0                1       0               780              ]
                  [0                0       0               1                ]];

            T2 = [[cos(theta2)      sin(theta2)     0       1280 * cos(theta2)]
                  [sin(theta2)      -cos(theta2)    0       1280 * sin(theta2)]
                  [0                0               -1      0                 ]
                  [0                0               0       1                 ]];

            T3 = [[cos(theta3)      0       sin(theta3)     200 * cos(theta3)]
                  [sin(theta3)      0       -cos(theta3)    200 * sin(theta3)]
                  [0                1       0               0                ]
                  [0                0       0               1                ]];

            T4 = [[cos(theta4)      0       sin(theta4)     0 * cos(theta4)  ]
                  [sin(theta4)      0       -cos(theta4)    0 * sin(theta4)  ]
                  [0                1       0               -1592.5          ]
                  [0                0       0               1                ]];

            T5 = [[cos(theta5)      0       sin(theta5)     0 * cos(theta5)   ]
                  [sin(theta5)      0       -cos(theta5)    0 * cos(theta5)   ]
                  [0                1       0               0                 ]
                  [0                0       0               1                 ]];
            
            T6 = [[cos(theta6)      -sin(theta6)    0       0 * cos(theta6)   ]
                  [sin(theta6)      cos(theta6)     0       0 * cos(theta6)   ]
                  [0                0               1       200               ]
                  [0                0               0       1                 ]];

theta1_val = 20 * pi / 180; theta2_val = - 0 * pi / 180 + pi / 2; theta3_val = -10 * pi / 180;
T06 = double(subs(T1 * T2 * T3 * T4 * T5 * T6, [theta1 theta2 theta3 theta4 theta5 theta6], [theta1_val theta2_val theta3_val 0 0 0]))

point = T06 * [0 0 0 1]';
XYZtarget = point(1:3) - T06(1:3, 1:3) * [0 0 200]';

T04 = T1 * T2 * T3 * T4;

XYZvect = simplify(T04(1:3, 4));

theta1_pred = atan(XYZtarget(2) / XYZtarget(1));

guess = [-85 * pi / 180 + (65 * pi / 180 - (- 85 * pi / 180)) * rand
         -180 * pi / 180 + (70 * pi / 180 - (- 180 * pi / 180)) * rand];
funct = subs([XYZvect(1); XYZvect(3)], theta1, theta1_pred);

iteration = 0;
while 1
    old = guess;
    deltaTarget = [XYZtarget(1); XYZtarget(3)] - double(subs(funct, [theta2 theta3], guess'));

    jacob = double(subs(jacobian(funct), [theta2 theta3], guess'));
    
    guess = guess + inv(jacob) * deltaTarget

    if norm(old - guess) / norm(guess) < 1e-6    
        if (guess(1) >= -85 * pi / 180 && guess(2) <= 65 * pi / 180 && guess(2) > -pi && guess(2) < 70 * pi / 180)
            break
        else
            guess = [-85 * pi / 180 + (65 * pi / 180 - (- 85 * pi / 180)) * rand
            -180 * pi / 180 + (70 * pi / 180 - (- 180 * pi / 180)) * rand];
            iteration = 0;
        end
    end
    iteration = iteration + 1;
    
    if iteration > 40
        guess = [-85 * pi / 180 + (65 * pi / 180 - (- 85 * pi / 180)) * rand
         -180 * pi / 180 + (70 * pi / 180 - (- 180 * pi / 180)) * rand];
        iteration = 0;
    end
end

% Example radian angles
theta1_pred = theta1_pred;
theta2_guess = -(guess(1) - pi / 2);
theta3_guess = guess(2);

% Convert radians to degrees
degrees = rad2deg([theta1_pred, theta2_guess, theta3_guess]);

double(subs(XYZvect, [theta1, theta2, theta3], [theta1_pred, guess(1), guess(2)]))
XYZtarget
degrees

%% 
clear
syms theta1 theta2 theta3 theta4 theta5 theta6

            T1 = [[cos(theta1)      0       sin(theta1)     320 * cos(theta1)]
                  [sin(theta1)      0       -cos(theta1)    320 * sin(theta1)]
                  [0                1       0               780              ]
                  [0                0       0               1                ]];

            T2 = [[cos(theta2)      sin(theta2)     0       1280 * cos(theta2)]
                  [sin(theta2)      -cos(theta2)    0       1280 * sin(theta2)]
                  [0                0               -1      0                 ]
                  [0                0               0       1                 ]];

            T3 = [[cos(theta3)      0       sin(theta3)     200 * cos(theta3)]
                  [sin(theta3)      0       -cos(theta3)    200 * sin(theta3)]
                  [0                1       0               0                ]
                  [0                0       0               1                ]];

            T4 = [[cos(theta4)      0       sin(theta4)     0 * cos(theta4)  ]
                  [sin(theta4)      0       -cos(theta4)    0 * sin(theta4)  ]
                  [0                1       0               -1592.5          ]
                  [0                0       0               1                ]];

            T5 = [[cos(theta5)      0       sin(theta5)     0 * cos(theta5)   ]
                  [sin(theta5)      0       -cos(theta5)    0 * cos(theta5)   ]
                  [0                1       0               0                 ]
                  [0                0       0               1                 ]];
            
            T6 = [[cos(theta6)      -sin(theta6)    0       0 * cos(theta6)   ]
                  [sin(theta6)      cos(theta6)     0       0 * cos(theta6)   ]
                  [0                0               1       200               ]
                  [0                0               0       1                 ]];

theta1_val = 0 * pi / 180; theta2_val = - 40 * pi / 180 + pi / 2; theta3_val = -40 * pi / 180; theta4_val = 0 * pi / 180; theta5_val = 0 * pi / 180; theta6_val = 0 * pi / 180;
T06 = double(subs(T1 * T2 * T3 * T4 * T5 * T6, [theta1 theta2 theta3 theta4 theta5 theta6], [theta1_val theta2_val theta3_val theta4_val theta5_val theta6_val]));

fixError = zeros(size(T06));
fixError(abs(T06) > 1e-6) = 1;
T06 = T06 .* fixError;

T06(1:3, 1:3)

theta = atan2(sqrt(T06(3, 1) ^ 2 + T06(3, 2) ^ 2), T06(3,3));
gamma = atan2(T06(1, 3), T06(2, 3));
phi = atan2(T06(3, 1), -T06(3, 2));

R06 = [cos(phi) * cos(gamma) - cos(theta) * sin(phi) * sin(gamma)      sin(phi) * cos(gamma) + cos(theta) * cos(phi) * sin(gamma)      sin(theta) * sin(gamma);
       -cos(phi) * sin(gamma) - cos(theta) * sin(phi) * cos(gamma)     -sin(phi) * sin(gamma) + cos(theta) * cos(phi) * cos(gamma)     sin(theta) * cos(gamma);
       sin(theta) * sin(phi)                                           -cos(phi) * sin(theta)                                          cos(theta)];

fixError = zeros(size(R06));
fixError(abs(R06) > 1e-6) = 1;
R06 = R06 .* fixError;

point = T06 * [0 0 0 1]';
XYZtarget = point(1:3) - R06 * [0 0 200]';

X = XYZtarget(1); Y = XYZtarget(2); Z = XYZtarget(3);

theta1_val = atan2(Y, X);

D0 = 780;
L1 = 320;
L2 = 1280;
L3 = 200;
D1 = 1592.5;

beta = atan2(D1, L3);
sigma = atan2(Z - D0, sqrt(X^2 + Y^2) - L1);

BW = sqrt((Z - D0) ^ 2 + (sqrt(X^2 + Y^2) - L1) ^ 2);
CB = L2;
CW = sqrt(L3^2 + D1^2);

cosphi = (BW^2 + CB^2 - CW^2) / (2 * BW * CB);
phi1 = atan2(sqrt(1 - cosphi^2), cosphi);
phi2 = atan2(-sqrt(1 - cosphi^2), cosphi);

theta2_val1 = sigma - phi1;
theta2_val2 = sigma - phi2;

cosgamma = -(CB^2 + CW^2 - BW^2) / (2 * CB * CW);
gamma1 = atan2(sqrt(1 - cosgamma^2), cosgamma);
gamma2 = atan2(-sqrt(1 - cosgamma^2), cosgamma);

theta3_val1 = -(gamma1 + beta);
theta3_val2 = -(gamma2 + beta);

if (theta2_val1 <= rad2deg(155) && theta2_val1 >= rad2deg(5) && theta3_val1 >= rad2deg(-180) && theta3_val1 <= rad2deg(70))
    theta2_val = theta2_val1;
    theta3_val = theta3_val1;
else
    theta2_val = theta2_val2;
    theta3_val = theta3_val2;
end

T46 = T4 * T5 * T6;
unknownR46 = simplify(T46(1:3, 1:3))

T03 = double(subs(T1 * T2 * T3, [theta1 theta2 theta3], [theta1_val theta2_val theta3_val]));
inverseR03 = inv(T03(1:3, 1:3));
R04 = inverseR03 * R06;

% Fix for if the value is bullshitting with me. AKA -0.0000
fixError = zeros(size(R04));
fixError(abs(R04) > 1e-6) = 1;
R04 = R04 .* fixError;

theta4_val = atan2(R04(2,3), R04(1,3));
theta5_val = atan2(sqrt(R04(1, 3)^2 + R04(2, 3)^2), -R04(3, 3));
theta6_val = atan2(-R04(3,2), R04(3,1));


