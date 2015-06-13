function output = ttable(values)

  output = feval(@(y)feval(@(x)mod(ceil(repmat((1:x(1))', 1, numel(x) - 1) ./ repmat(x(2:end), x(1), 1)) - 1, repmat(fliplr(y), x(1), 1)) + 1, fliplr([1 cumprod(y)])), fliplr(values));
end