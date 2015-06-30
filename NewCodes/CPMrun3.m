function winners = CPMrun3(MatCell,ABNames)
%
% Compute every combination of length 2 transition probability matrices
% which corresponds to antibiotic cycles of length 2
% 
% Inputs:
%     MatCell .... cell array of the transition probability matrices
%     abnames .... string vector containing the antibiotic names
%
% Outputs:
%     winners .... cell array containing highest probability transitions
%                  with corresponding antibiotic treatments 
%

numalleles = 16;
numab = length(ABNames); % determine number of antibiotics

winners = cell(numalleles,2);    % initialize cell of winners. 

for i=1:numalleles winners{i,1} = 0; end

for i=1:numab
    for j=1:numab
        for l=1:numab
            MatProd = MatCell{i}*MatCell{j}*MatCell{l};
            treatijl = strcat(ABNames(i),'+', ABNames(j),'+',ABNames(l));
            for k=2:16
                WildProb = MatProd(k,1);
                if WildProb ~= 0
                    if WildProb > winners{k,1}
                        winners{k,1} = WildProb;
                        winners{k,2} = treatijl;
                    elseif WildProb == winners{k,1}
                        winners{k,2} = [winners{k,2}; treatijl];
                    end
                end     
            end
        end
    end
end
        