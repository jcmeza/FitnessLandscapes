function [ ] = Plot_Mk( MMatrixCell )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

nmat = length(MMatrixCell);
nodenames = {'0000', '1000', '0100', '0010',...
    '0001', '1100', '1010', '1001', ...
    '0110', '0101', '0011', '1110', ...
    '1101', '1011', '0111', '1111'};

for i=1:nmat
    Mi = MMatrixCell(i);
    Mi = cell2mat(Mi);
    GMi = digraph(Mi,nodenames,'OmitSelfloops');
    GMi.Edges.LWidths = 7*GMi.Edges.Weight/max(GMi.Edges.Weight);
    pgm(i) = plot(GMi,'Layout','force','EdgeLabel',GMi.Edges.Weight);
    pgm(i).NodeColor = 'red';
    pgm(i).LineWidth = GMi.Edges.LWidths;
    pause
end
end
