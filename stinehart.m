%-----------------------------------------------------------------------%
%                     GNU GENERAL PUBLIC LICENSE                        %
%                       Version 3, 29 June 2007                         %
%                                                                       %
%        This function calculates Stinehart coeff from T and R values   %
%                                                                       %
%            https://github.com/Matthew-J-Read/MATLAB-AES.git           %
%                  Copyright © 2020  Matthew J Read                     %
% ----------------------------------------------------------------------%
function stinehart()
K = 273.15;                            % kelvin coeff
t1 = 16; t2 = 84; t3 = 133;           % degC
T1 = (t1+K); T2 = (t2+K); T3 = (t3+K); % convert to kelvin
R1 = 10215.59; R2 = 1691.52	; R3 = 672.4;         % resistance
%(1/T) = A+(B*log(R))+(C*(log(R))^3);
a = 1/T1; b = log(R1); c = (log(R1)^3);
d = 1/T2; e = log(R2); f = (log(R2)^3);
g = 1/T3; h = log(R3); i = (log(R3)^3);

M = [1 b c; 1 e f; 1 h i];
M1 = [a b c; d e f; g h i];
M2 = [1 a c; 1 d f; 1 g i];
M3 = [1 b a; 1 e d; 1 h g];

A = det(M1)/det(M)
B = det(M2)/det(M)
C = det(M3)/det(M)

Vs = 5;
Vo = 0;
Y = (Vo/Vs)+(R3/(R1+R3));
R4 = (R2*Y)/(1-Y)
end
% ----------------------------------------------------------------------%