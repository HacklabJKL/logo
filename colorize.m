function b = colorize (n = 5, m = 1)
  b = nan (m, 1 + n, 3);
  for i = 1 : m
    for j = 1 : 1 + n
      h = mod (68 + 256 .* (i - 1) ./ m, 256);
      s = 102;
      l = 255 .* (j - 1) ./ n;
      b(i, j, :) = round (255 .* hsv2rgb (hsl2hsv ([h, s, l] ./ 255)));
    end
  end

  printf ('P3\n');
  printf ('%d %d\n', 1 + n, m);
  printf ('255\n');
  for i = 1 : size (b)(1)
    for j = 1 : size (b)(2)
      for k = 1 : size (b)(3)
        printf ('  %3d', b(i, j, k));
      end
      printf ('\n');
    end
  end

  figure (1);
  clf ();
  imshow (b ./ 255);

  figure (2);
  clf ();
  plot3 (b(:, :, 1) .', b(:, :, 2) .', b(:, :, 3) .', '-');
end
