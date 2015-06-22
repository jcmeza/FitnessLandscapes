function [adj_list,adj_mat] = CompAdj(vertices)

%
% Given a nxm matrix 'vertices' CompAdj will output:
% an nxm matrix adj_list where each row i lists the vertices adjacent to vertex i
% an mxm adjcency matrix for the given graph represented by vertices
%

[n, m] = size(vertices);

adj_list = zeros(2^m, m);
adj_mat = zeros(2^m, 2^m);
for v=1:2^m
  L1_dists = sum(abs(vertices - repmat(vertices(v, :), 2^m, 1)), 2);
  adj_list(v, :) = find(L1_dists == 1);
  adj_mat(v, find(L1_dists == 1)) = 1;
end
end
