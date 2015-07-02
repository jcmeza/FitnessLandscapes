function [] = PrintPlans(fid, plans)
% PrintPlans .... Print Treatment Plans 
%
% Inputs
%   fid .... File id for output
%   winners .... cell array containing the highest prob. plans
%                each entry corresponds to all of the treatment plans found
%                for returning to the wild type from one allele
%  

    formatSpec = '%6d %s %s %s %s %s %s %s %s %s %s';
    [nrows,ncols] = size(plans);
    
    for row = 1:nrows
        fprintf(fid, formatSpec, row, plans{row,:});
        fprintf(fid,'\n');
    end
    
end

