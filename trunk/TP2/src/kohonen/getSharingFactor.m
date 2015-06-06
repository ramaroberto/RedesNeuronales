function [sharing_factor, cross_count_matrix] = getSharingFactor(counts_matrix)
    cross_count_matrix = zeros([size(counts_matrix,1), size(counts_matrix,2)]);
    non_zero_count = 0;
    
    for i = 1:size(counts_matrix,1)
        for j = 1:size(counts_matrix,2)
            for k = 1:size(counts_matrix,3)
                if counts_matrix(i,j,k) ~= 0
                    cross_count_matrix(i,j) = cross_count_matrix(i,j) + 1;
                end
            end
            if cross_count_matrix(i,j) ~= 0
                non_zero_count = non_zero_count + 1;
            end
        end
    end
    
    sharing_factor = (sum(sum(cross_count_matrix))-non_zero_count)/non_zero_count;
    
    