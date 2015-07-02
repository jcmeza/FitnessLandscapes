function winners = CPMrun5(MatCell,ABNames)
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

for i=1:numalleles 
    winners{i,1} = 0; 
end

for i1=1:numab
  Mat1 = MatCell{i1};
  for i2=1:numab
    Mat2 = Mat1*MatCell{i2};
    for i3=1:numab
      Mat3 = Mat2*MatCell{i3};
      for i4=1:numab
        Mat4 = Mat3*MatCell{i4};
        for i5=1:numab
            MatProd = Mat4*MatCell{i5};
            treatijlmk= [ABNames(i1),'+', ABNames(i2),'+',ABNames(i3),'+',ABNames(i4),'+',ABNames(i5)];
            for k=2:16
              WildProb = MatProd(k,1);
              if WildProb ~= 0
                if WildProb > winners{k,1}
                   winners{k,1} = WildProb;
                   winners{k,2} = treatijlmk;
                elseif WildProb == winners{k,1}
                     winners{k,2} = [winners{k,2}; treatijlmk];
                end
              end     
            end
        end
      end
    end
  end
end
        