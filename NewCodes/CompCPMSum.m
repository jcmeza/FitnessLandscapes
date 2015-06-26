function [fitnessSum] = CompCPMSum(adj_list,growthmeans)
%
% Helper function for CompCPM 
%
% Input
%   adj_list ........ adjacency list of neighbors
%   growthmeans ..... growth means for this particular antibiotic
% 
% Output
%   fitSum .......... the sum of the fitnesses of the neighbors
%
%
[n,m] = size(adj_list); 
%
% for each genotype check neighbors
%
fitnessSum = zeros(n,1);

for i=1:n
    alphai = growthmeans(i);
    for k=1:m
        alphak = growthmeans(adj_list(i,k));
        fitnessSum(i) = fitnessSum(i) + max(0,alphak - alphai);
    end
end

