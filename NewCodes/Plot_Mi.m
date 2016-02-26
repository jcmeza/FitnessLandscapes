function [ ] = Plot_Mi( Mi)
%Plot graph of transition prob matrix

nodenames = {'0000', '1000', '0100', '0010',...
    '0001', '1100', '1010', '1001', ...
    '0110', '0101', '0011', '1110', ...
    '1101', '1011', '0111', '1111'};
    GMi = digraph(Mi,nodenames,'OmitSelfloops');
    GMi.Edges.LWidths = 7*GMi.Edges.Weight/max(GMi.Edges.Weight);
    pgm = plot(GMi,'Layout','force','EdgeLabel',GMi.Edges.Weight);
    pgm.NodeColor = 'red';
    pgm.LineWidth = GMi.Edges.LWidths;
end

