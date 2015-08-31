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

for i1=1:numalleles winners{i1,1} = 0; end

for i1=1:numab
    Mat1 = MatCell{i1};
    for i2=1:numab
        Mat2 = Mat1*MatCell{i2};
        for i3=1:numab
            treatijl = [ABNames(i1),'+', ABNames(i2),'+',ABNames(i3)];
            Mat3 = Mat2*MatCell{i3};
            WildProb = Mat3(:,1);        
            nzprob = find(WildProb)'; % find nonzero probabilities
            
            for k=nzprob
                %if WildProb(k) > .3333333 && WildProb(k) < .6666667
                %    winners{k,2} = [winners{k,2}; treatijl];
                %end
                if WildProb(k) > winners{k,1}
                    winners{k,1} = WildProb(k);
                    winners{k,2} = treatijl;
                elseif WildProb(k) == winners{k,1}
                    winners{k,2} = [winners{k,2}; treatijl];
                end     
            end
        end
    end
end
        