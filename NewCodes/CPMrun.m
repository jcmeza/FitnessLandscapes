function winners = CPMrun(MatCell,abnames)
%
% Compute every combination of length 2 transition probability matrices
% which corresponds to antibiotic cycles of length 2
%
numab = length(abnames); % number of antibiotics
winners = cell(16,3);
for i=1:16 winners{i,1} = 0; end

for i=1:numab
    for j=1:numab
        MatProd = MatCell{i}*MatCell{j};
        for k=2:16
            WildProb = MatProd(k,1)
            if WildProb > winners{k,1}
                winners{k,1} = WildProb;
                winners{k,2} = abnames(i);
                winners{k,3} = abnames(j);
            end
        end
    end
end
        