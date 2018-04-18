% The function Power_calculation takes in the P threshold, wavelength, G
% and K values with the route array and gives out the Power of the source
% reader.
function [P_Ra] = Power_calculation(P_th, lambda, G, K, array, final_output)

len = length(array);
const = P_th*(4*pi/lambda)^2;
mul_val = 1;

if array == 0
    P_Ra = inf;     % If there is no shortest route, give output as infinty
    return;
end
% Calculation of P_Ra
for j = 1:len-1
    distance_sq = (final_output(array(j),1)- final_output(array(j+1),1))^2 + (final_output(array(j),2)- final_output(array(j+1),2))^2;
    mul_val = mul_val*(distance_sq)/(G(array(j))*G(array(j+1))*K(array(j)));
end
P_Ra = const*mul_val;
end