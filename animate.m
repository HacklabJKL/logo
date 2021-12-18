function [v, t] = animate (n = 2, m = 1)
  v = cell (m, 1);
  t = cell (m, 1);
  for i = 1 : m
    % We need this branch,
    % because `length (dec2base (d, base, len)) == len` does not hold
    % even when `len == ceil (log1p (d) ./ log (base))`.
    if n == 0
      v{i} = ['0', '1'];
    else
      v{i} = ['0', (dec2base (randi ([0, 2 .^ n - 1]), 2, n)), '1'];
    end
    t{i} = ['0.', (dec2base (randi ([1, 9]), 10, 1))];
  end

  for i = 1 : m
    printf (['<animate ', ...
      'attributeName="opacity" ', ...
      'values="%s" ', ...
      'dur="%ss" ', ...
      'calcMode="discrete" ', ...
      '/>\n'], vec ([v{i}; (repmat (';', size (v{i})))])(1 : end - 1), t{i});
  end
end
