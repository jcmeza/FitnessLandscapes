function winners = CPMrun4(MatCell,ABNames)
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

for i1=1:numalleles winners{i1,1} = 0; end

for i1=1:numab
    Mat1 = MatCell{i1};
    for i2=1:numab
        Mat2 = Mat1*MatCell{i2};
        for i3=1:numab
            Mat3 = Mat2*MatCell{i3};
            for i4=1:numab
                treatijlm = [ABNames(i1),'+', ABNames(i2),'+',ABNames(i3),'+',ABNames(i4)];
                Mat4 = Mat3*MatCell{i4};
                WildProb = Mat4(:,1);        
                nzprob = find(WildProb)'; % find nonzero probabilities
                
                for k=nzprob %only check when WildProb(k) ~= 0  
                    if WildProb(k) > winners{k,1}
                        winners{k,1} = WildProb(k);
                        winners{k,2} = treatijlm;
                    elseif WildProb(k) == winners{k,1}
                        winners{k,2} = [winners{k,2}; treatijlm];
                    end
                end
            end
        end
    end
end
        