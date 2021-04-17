function LHS = F(x)
f1 = x(1).^2 + x(2) - 37;
f2 = x(1) - x(2).^2 - 5;
f3 = x(1) + x(2) + x(3) - 3;
LHS = [f1; f2; f3];
end

