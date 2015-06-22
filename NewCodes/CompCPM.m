function [ProbMat] = CompCPM(adj_list,growthmeans,fitSum)
%
% Computing CPM Probability Transition Matrix 
%
[n,m] = size(adj_list); 
%
% for each allele check neighbors
%
ProbMat = zeros(n,n);
for i=1:n
    alphai = growthmeans(i);
    if fitSum(i) ~= 0 
        for k=1:m
            j = adj_list(i,k);
            alphaj = growthmeans(j);
            fitDiff = max(0,alphaj - alphai);
            ProbMat(i,j) = fitDiff/fitSum(i);
        end
    end
end
