function [rel_dist, avg_dist, dist_map] = distanceToDominants(act_train, act_test, manhattan)
    % Initialization
    if nargin < 3; manhattan = false; end;
    positions = cell(1,9);
    avg_dist = 0;
    dist_map = zeros(size(act_train));
    non_zeros = 0;
    
    % Iterate matrices
    for i = 1:size(act_test, 1)
        for j = 1:size(act_test, 2)
            current_pos = [i, j];
            class = act_test(i,j);
            if class ~= 0
                non_zeros = non_zeros + 1;
                if isempty(positions{class})
                    [rows, cols] = find(class*ones(size(act_train)) == act_train);
                    positions{class} = [rows cols];
                end
                mht_diffs = abs(ones(size(positions{class},1),1)*current_pos-positions{class});
                if manhattan
                    distance = min(sum(mht_diffs,2));
                else
                    distance = min(sqrt(sum(abs(mht_diffs).^2,2)));
                end
                avg_dist = avg_dist + distance;
                dist_map(i,j) = distance;
            end
        end
    end
    avg_dist = avg_dist / non_zeros;
    
    if manhattan
        rel_dist = avg_dist / (size(act_test, 1) + size(act_test, 2));
    else
        rel_dist = avg_dist / norm(size(act_test));
    end
    
   
    
    
    