function [MaxP] = MaxP_trial(adj_list, MMatrixCell)

MaxP = zeros(16,16);
num_matrices = length(MMatrixCell);
%For each vertex in adj_list: I need to use Vij
for i = 1:16
    % for each adjacent vertex, find max probability for each 
    % transition from i to j and for each antibiotic
    for j= 1:4
        vij = adj_list(i,j);
        %For each probability transition matrix compute maxP over all matrices.
        onemaxp = -1;
        for k = 1:num_matrices
            Mk = MMatrixCell{k};
            onemaxp = max(onemaxp,Mk(i,vij));
        end
        MaxP(i,vij) = onemaxp;
    end
end




