%
% Matlab version of Bernd's CPMrun Maple scripts
% This version of TimeMachine simpley reads the M matrices computed and
% saved by Bernd's Maple code
%
% The number of alleles may change in the future, but for now it is set to
% 16
numalleles = 16;

% Read in the Growth Rate means file and save the Antibiotic names
%[vertices, GRMeans, ABNames] = ReadMeans();

%numab = length(ABNames); % determine number of antibiotics

% Compute the adjacency list and matrix for this vertex ordering
vertices = csvread('vertdeglex.csv');
[adj_list,adj_mat] = CompAdj(vertices);

%
% Read in Bernd's probability transition matrix
%
MatCell = readAll();

winners0 = CPMrun(MatCell,berndorder);

for i=2:numalleles
    allele = strcat('[', num2str(vertices(i,:)),']');
    % Any winners for this allele?
    if isempty(winners0{i,2})
        fprintf('\n %s %s %e', allele, 'No Plans Found');
    else
        prob   = winners0{i,1};
        fprintf('\n %s %s %e', allele, 'Prob = ', prob);
        fprintf('%s %s', '    Plans: ', strjoin(winners0{i,2}, ', '));
    end
        
end
fprintf('\n');