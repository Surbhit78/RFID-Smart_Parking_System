% The function bellmanford_code takes in the weights as cost, the source
% and the destination and computes the shortest path between the source and
% the destination
function [ShortestPath] = bellmanford_code(costs, source, dest)

n = size(costs, 1);         % determine the size of S
S(1:n) = 0;                 % initialize S to all 0's
distance(1:n) = inf;        % initialize distance vector to all inf
previous(1:n) = inf;        % initialize previous node vector to all inf
distance(source) = 0;       % set source distance to 0
for (i = 1:n-1)
    for (j = 1:n)           % Update distance vector if feasible
        for (k = 1:n)
            if ((distance(j) + costs(j,k) < distance(k)) && (costs(j,k) ~= 0))
                distance(k) = distance(j) + costs(j,k);
                previous(k) = j;
            end
        end
    end
end
for i =1:length(distance)
    if distance(i) == Inf
        distance(i) = 0;
    end
end
% The modified bellman ford algorithm incorporates the negative weight
% cycle and if they are encountered, gives the output as 0. This is where
% bellman ford is better than Dijkstra since the latter does not consider
% negative weight cycles as we are getting in our case due to the log
% function
distance
for (j = 1:n)
    for (k = 1:n)
        if ((distance(j) + costs(j,k) < distance(k)) && (costs(j,k) ~= 0))
            ShortestPath = zeros;
            return;   
        end
    end
end
% Output Distance vector
ShortestPath = [dest];
traverse = dest;
count = 0;
while (previous(traverse) ~= source) % Traverse backwards to find path
    ShortestPath = [previous(traverse) ShortestPath];
    traverse = previous(traverse);
    count = count + 1;
end
ShortestPath = [previous(traverse) ShortestPath]; % Returns the shortest path 
end
