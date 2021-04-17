function x = newton(F, J, x0)
x = x0;
%res = sum(abs(F(x)));
%i = 0;
for i = 1:8
    J_ = inv(J(x));
    x = x - J_ * F(x);
%    res = sum(abs(F(x)));
end
%sprintf("Newton takes %d iterations", i)
end