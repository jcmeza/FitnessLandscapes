ndim = 4;
vertices = ttable(ones(1, ndim) * 2) - 1;

adj_list = zeros(2^ndim, ndim);
adj_mat = zeros(2^ndim, 2^ndim);
for v=1:2^ndim
  L1_dists = sum(abs(vertices - repmat(vertices(v, :), 2^ndim, 1)), 2);
  adj_list(v, :) = find(L1_dists == 1);
  adj_mat(v, find(L1_dists == 1)) = 1;
end