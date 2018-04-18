% The funstion Gain_values uses the size of the matrix and the total number
% of elements

function [G] = Gain_values(sizeMatrix,count_total)
G = zeros(sizeMatrix);
G(703) = 23;            % Gain value of the target node

% Sample tags in the system with their gain values
G(4) = 15;  G(110) = 18; G(17) = 18; G(113) = 15; G(77) = 10;
G(65) = 25; G(70) = 16; G(118) = 28; G(225) = 18; G(308) = 20; 
G(247) = 12;   G(357) = 15; G(405) = 12; G(439) = 10;   G(456) = 12;
% G(8) = 12; G(53) = 14; G(126) = 15; G(159) = 13;G(231) = 10; G(286) = 15; G(341) = 15; G(492) = 12;G(445) = 13;G(268) = 12; 
G(610) = 18; G(655) = 23; G(637) = 18;
G(175) = 14; G(8) = 23; G(215) = 22; G(157) = 12; G(230) = 12; G(163) = 15;
G(2) = 10; G(101) = 13;


%%%%%%%%%% READERS %%%%%%%%%%%
for i=1:count_total
    if i == 1 ||i == count_total
       G(i) = 15; 
    elseif mod(i, sizeMatrix) == 0 && i < count_total
        G(i+1) = 15;
        G(i) = 15;    
    end   
end
count = 0;
for i = 1:count_total
    if G(i) ~= 0
        count = count+1;
    end
end
end
