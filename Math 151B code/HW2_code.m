f = @(t,y) y - t.^2 + 1;
w(1) = 0.5;
x(1) = 0.5;
q(1) = 0.5;
h = 0.2;
t = 0:h:2;
exact = (t + 1).^2 - 0.5*exp(t);

for i=2: numel (t)
% Euler's Method
x(i) = x(i-1)+h*f(t(i-1),x(i-1));

%Modified Euler Method
q(i) = q(i-1)+(h/2)*(f(t(i-1),q(i-1)) + f(t(i), q(i-1)+h*f(t(i-1),q(i-1))));

% Heun's Method
k1 = h*f(t(i-1),w(i-1));
k2 = h*f(t(i-1)+h/3, w(i-1)+(1/3)*k1);
k3 = h*f(t(i-1)+(2/3)*h, w(i-1)+(2/3)*k2);
w(i) = w(i-1) +(1/4)*(k1+3*k3);
end

R = [w; q; x]

hold on
plot(t,w);
plot(t,q);
plot(t,x);
hold off
