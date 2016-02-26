MaxP_G = digraph(MaxP,'OmitSelfLoops');
plot(MaxP_G,'Layout','force','EdgeLabel',MaxP_G.Edges.Weight);