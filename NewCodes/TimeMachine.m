%
% Matlab version of Bernd's CPMrun Maple scripts
%
%
% The number of alleles may change in the future, but for now it is set to
% 16
numalleles = 16;

% Read in the Growth Rate means file and save the Antibiotic names
[vertices, GRMeans, ABNames] = ReadMeans('MeanAll_T50_reorder.csv');

numab = length(ABNames); % determine number of antibiotics

% Compute the adjacency list and matrix for this vertex ordering
[adj_list,adj_mat] = CompAdj(vertices);

%
% Compute one probability transition matrix
%
MMatrixCell = cell(1,15);
for i=1:numab
    gri = GRMeans(i,:);
    fitnessSum = CompCPMSum(adj_list,gri);
    ProbMat = CompCPM(adj_list,gri,fitnessSum);
    MMatrixCell(i) = {ProbMat};
end

winners = CPMrun(MMatrixCell,ABNames);

%
% Print out results in a nice readable format
%
for i=2:numalleles
    allele = strcat('[', num2str(vertices(i,:)),']');
    % Any winners for this allele?
    if isempty(winners{i,2})
        fprintf('\n %s %s %e', allele, 'No Plans Found');
    else
        prob   = winners{i,1};
        nplans = size(winners{i,2},1);
        fprintf('\n %s %s %e', allele, 'Prob = ', prob);
        fprintf('%6d %s %s', nplans, 'Plans found: ', strjoin(winners{i,2}, ', '));
    end
        
end
fprintf('\n');
