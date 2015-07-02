function [] = PrintPlans(fid, winners)
% PrintPlans .... Print Treatment Plans 
%
% Inputs
%   fid .... File id for output
%   winners .... cell array containing the highest prob. plans
%                each entry corresponds to all of the treatment plans found
%                for returning to the wild type from one allele
%  

    formatSpec = '%6d %s\n';
    [nrows,ncols] = size(winners);
    
    for row = 1:nrows
        fprintf(fid, formatSpec, row, winners{row,:});
    end
    
end

