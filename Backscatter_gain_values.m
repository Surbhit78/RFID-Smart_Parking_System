% The funstion Backscatter_gain_values uses the size of the matrix and the total number
% of elements
function [K] = Backscatter_gain_values(sizeMatrix,count_total)
K = zeros(sizeMatrix);

K(703) = 0.36;          % Backscatter Gain value of the target node

% Sample tags in the system with their Backscatter Gain values
K(610)= 0.23; K(655) = 0.22;
K(4) = 0.15;K(110) = 0.13;  K(17) = 0.25; K(113) = 0.23; K(77) = 0.18;
K(65) = 0.25; K(70) = 0.25; K(118) = 0.22; K(225) = 0.22; K(308) = 0.2; 
K(247) = 0.19;K(357) = 0.23;  K(405) = 0.42; K(439) = 0.35;K(456) = 0.32;
K(8) = 0.25; K(53) = 0.14; K(126) = 0.32; K(159) = 0.15;K(231) = 0.10; K(286) = 0.11; K(341) = 0.24; K(492) = 0.12;K(445) = 0.13;K(268) = 0.12;
K(175) = 0.14;  K(8) = 0.35;K(215) = 0.29; K(157) = 0.12; K(230) = 0.12; K(163) = 0.15;

%%%%%%%%%%%%%%READERS%%%%%%%%%%%%%%

for i=1:count_total
    if i == 1 ||  i == count_total
       K(i) = 0.01; 
    elseif mod(i, sizeMatrix) == 0 && i < count_total
        K(i+1) = 0.01;
        K(i) = 0.01;     
    end   
end
end