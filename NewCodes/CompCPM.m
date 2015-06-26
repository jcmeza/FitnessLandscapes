function [ProbMat] = CompCPM(adj_list,growthmeans,fitSum)
%
% Computing CPM Probability Transition Matrix 
%
% Input
%   adj_list ........ adjacency list of neighbors
%   growthmeans ..... growth means for this particular antibiotic
%   fitSum .......... the sum of the fitnesses of the neighbors
%
%
%

[n,m] = size(adj_list); 
%
% for each genotype check neighbors
%
ProbMat = zeros(n,n);
outdegree = zeros(n);

for i=1:n
    alphai = growthmeans(i);
    count = 0;
    if fitSum(i) ~= 0     
        for k=1:m
            j = adj_list(i,k);
            alphaj = growthmeans(j);
            fitDiff = max(0,alphaj - alphai);
            if (fitDiff > 0.0)
                ProbMat(i,j) = fitDiff/fitSum(i);
                count = count + 1;
            end
        end
    end
    outdegree(i) = count;
    if outdegree(i) == 0   % Check to see if there are no outgoing vertices
        ProbMat(i,i) = 1.0;
    end
end
