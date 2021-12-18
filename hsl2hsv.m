function d = hsl2hsv (c)
  [h, s, l] = num2cell (c, 1){:};

  v = l + s .* min (l, 1 - l);
  s = merge (v == 0, 0, 2 .* (1 - l ./ merge (v == 0, eps (), v)));

  d = [h, s, v];
end
