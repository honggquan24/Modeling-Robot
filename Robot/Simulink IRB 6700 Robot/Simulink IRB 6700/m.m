%syms theta1 theta2 theta3 theta4 theta5 theta6 real


syms theta1 theta2 theta3 theta4 theta5 theta6

            T1 = [[cos(theta1)      0       -sin(theta1)     320 * cos(theta1)]
                  [sin(theta1)      0       cos(theta1)    320 * sin(theta1)]
                  [0                -1       0               780              ]
                  [0                0       0               1                ]];

            T2 = [[cos(theta2)      -sin(theta2)     0       1280 * cos(theta2)]
                  [sin(theta2)      cos(theta2)    0       1280 * sin(theta2)]
                  [0                0               1      0                 ]
                  [0                0               0       1                 ]];

            T3 = [[cos(theta3)      0       -sin(theta3)     200 * cos(theta3)]
                  [sin(theta3)      0       cos(theta3)    200 * sin(theta3)]
                  [0                -1       0               0                ]
                  [0                0       0               1                ]];

            T4 = [[cos(theta4)      0       sin(theta4)     0 ]
                  [sin(theta4)      0       -cos(theta4)    0]
                  [0                1       0               1592.5          ]
                  [0                0       0               1                ]];

            T5 = [[cos(theta5)      0       -sin(theta5)     0   ]
                  [sin(theta5)      0       cos(theta5)    0    ]
                  [0                -1       0               0                 ]
                  [0                0       0               1                 ]];
            
            T6 = [[cos(theta6)      -sin(theta6)    0       0  ]
                  [sin(theta6)      cos(theta6)     0       0  ]
                  [0                0               1       0               ]
                  [0                0               0       1                 ]];
T03 = simplify(T1 * T2 * T3 * T4 * T5 * T6);
%T06 = simplify(T1 * T2 * T3 * T4 * T5 * T6);
%T03_INV = inv(T03); 
%A = T03_INV*T06; 
%T06_numeric = (subs(A));
%a = simplify(T03(1,4)*T03(1,4) +  T03(2,4)*T03(2,4) +  T03(3,4)*T03(3,4)); 
% Display the numeric values of the transformation matrix T06
%disp('Numeric values of T06:');
disp(T03);
%disp(a);

%fileID = fopen('C:\Users\ADMIN\Documents\Word\result.txt', 'w');

% Xuất dữ liệu ra file
%fprintf(fileID, '%s \n', T06(2,2)');

% Đóng file
%fclose(fileID);