[X,Y] = meshgrid(-2:0.1:2);
Z = abs(1 + X + Y * 1i + (X + Y *1i).^2/2);
contour(X, Y, Z, [1,1])