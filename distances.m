% The funtion distances takes in the array of path for the shortest
% distance and computes end to end distance
function end_to_end_dist = distances(bellman_output,final_output)
d_x = 10;
d_y = 3;
end_to_end_dist = 0;
% Computation of distance values through given points in the array
for i = 1:(length(bellman_output))
    final_output(bellman_output(i),:);
end
for i = 1:(length(bellman_output)-1)
    dist_x = final_output(bellman_output(i+1),1) - final_output(bellman_output(i),1);
    dist_y = final_output(bellman_output(i+1),2) - final_output(bellman_output(i),2);
    val = sqrt(dist_x^2 + dist_y^2);
    end_to_end_dist = end_to_end_dist + val;
end
end