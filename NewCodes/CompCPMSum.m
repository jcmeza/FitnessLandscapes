function [fitnessSum] = CompCPMSum(adj_list,growthmeans)

[n,m] = size(adj_list); 
%
% for each allele check neighbors
%
fitnessSum = zeros(n,1);
currentfitness = 0;
for i=1:n
    alphai = growthmeans(i);
    for k=1:m
        alphak = growthmeans(adj_list(i,k));
        fitnessSum(i) = fitnessSum(i) + max(0,alphak - alphai);
    end
end

