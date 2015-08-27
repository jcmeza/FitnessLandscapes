%
% Matlab version of Bernd's CPMrun Maple scripts
%
%
% The number of alleles may change in the future, but for now it is set to
% 16

numalleles = 16;

% Prompt for filename and read in the Growth Rate means
% Antibiotic names saved in ABNames

prompt = 'Please enter file name containing growth rate means: ';
filename = input(prompt,'s');
outname = strsplit(filename,'.'); % capture filename part before the '.csv'
outfile = outname(1);

[vertices, GRMeans, ABNames] = ReadMeans(filename);

numab = length(ABNames); % determine number of antibiotics

% Compute the adjacency list and matrix for this vertex ordering
[adj_list,adj_mat] = CompAdj(vertices);

%
% Compute one probability transition matrix for each of the antibiotic
% cases and store all of themin MMatrixCell array
%
MMatrixCell = cell(1,15);
for i=1:numab
    gri = GRMeans(i,:);
    fitnessSum = CompCPMSum(adj_list,gri);
    ProbMat = CompCPM(adj_list,gri,fitnessSum);
    MMatrixCell(i) = {ProbMat};
end

%
% Choose the cycle path 
%   CPMrun2 .... length 2 cycles
%   CPMrun3 .... length 3 cycles
%   CPMrun4 .... length 4 cycles
%
prompt = 'Please enter cycle length: ';
cycle_length = input(prompt);

t = cputime;
switch cycle_length
    
    case {2} 
        winners = CPMrun2(MMatrixCell,ABNames);
    case {3}
        winners = CPMrun3(MMatrixCell,ABNames);
    case {4}
        winners = CPMrun4(MMatrixCell,ABNames);
    case {5} 
        winners = CPMrun5(MMatrixCell,ABNames);
    case {6} 
        winners = CPMrun6(MMatrixCell,ABNames);
end
runtime = cputime-t;
%
% Print out results in a nice readable format
% Output file name will consist of input file name with cycle lenght 
% appended to record which problem we solved
% Open output file
%
%outfile = strcat('T85', 'Length', num2str(cycle_length), '.out');
outfile = strcat(char(outfile),'-Length', num2str(cycle_length), '.out');

fid = fopen(outfile, 'w');
fprintf(fid, 'Simulation run on: %s\n', date);
fprintf(fid, 'Output File name: %s\n', outfile);
fprintf(fid, 'Length of cycle: %d\n', cycle_length);
fprintf(fid, 'Run time: %e\n', runtime);

for i=2:numalleles
    allele = strcat('[', num2str(vertices(i,:)),']');
    
    % Any winners for this allele?
    if isempty(winners{i,2})
        fprintf(fid, '\n %s %s %e', allele, 'No Plans Found');
    else
        prob   = winners{i,1};
        nplans = size(winners{i,2},1);
        fprintf(fid, '\n %s %s %e\n', allele, 'Prob = ', prob);
        fprintf(fid, '%6d %s\n', nplans, 'Plans found:');
 %       fprintf('%s', strjoin(winners{i,2}, ', '));
 %       display(winners{i,2})
        PrintPlans(fid,winners{i,2});
    end
        
end


fprintf('%s %s\n', 'Output saved in', outfile);
fprintf('%s %e\n', 'Run time = ', runtime);


