% The function buildMatrix builds the matrix of weights which would be
% passed on to the different tags and readers in the system, it takes in
% the size of the matrix that is available and uses that to generate the
% weights. It calls the G and K values from the functions - Gain_values and
% Backscatter_gain_values.
function S = buildMatrix (sizeMatrix)

count_total = sizeMatrix^2;     % Total number of nodes present in the system
S = zeros(count_total);         % Makes an array of zeros with given size
source_x = 1;                   % Starting with the source's x coordinate as 1
source_y = 1;                   % Starting with the source's y coordinate as 1
count = 1;
d_x = 10;                       % Distance along the given axis is 10 units between two nodes, this accounts for the space for taking the car out
d_y = 3;                        % Distance along the given axis is 3 units between two nodes
dist = zeros();
% G1 and K1 are used as tranpose of the G and K values for given node
G1 = zeros(sizeMatrix,count_total);
K1 = zeros(sizeMatrix,count_total);
G = Gain_values(sizeMatrix,count_total);
G1 = G';
K = Backscatter_gain_values(sizeMatrix,count_total);
K1 = K';
temp = 1;
temp2 = 1;
%These loops traverse through different nodes and calculate the weights of
%each other nodes with respect to the given source nodes
for (source_x = 1:sizeMatrix)
    for(source_y = 1:sizeMatrix)
        for (x = 1:sizeMatrix)
            for (y = 1 :sizeMatrix)
                temp_x = abs(source_x - x);
                temp_y = abs(source_y - y);
                dist_x = d_x*temp_x;
                dist_y = d_y*temp_y;
                val = (dist_x^2 + dist_y^2);        % Calculates the distance of the target node from the source node
                % Weight calculation on the basis of Equation 10
                Temp = (G1(x, y)*G1(source_x,source_y)*K1(source_x,source_y)); 
                Temp2 = val/Temp;
                dist(temp) = log10(Temp2);
                if (dist(temp) == -Inf || isnan(dist(temp)))
                    dist(temp) = 0;
                end
                temp=temp+1;
            end
        end     
    end
end
% These loops  are used to put all the weights in accordance with the x and
% y coordinates
for (i = 1:count_total)
    for(j = 1:count_total)
        S(i,j) = dist(temp2);
        temp2 = temp2+1;
    end
end
end
