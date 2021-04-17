f= @(t,y) y .^2.* exp(-t); % RHS of ODE
df=@(t,y) f(t,y ).*(2* y.* exp (-t) -1); % df/dt for Taylor method
exact =exp (1); % exact value of y(1)
R =[];
for h =[0.5 0.1 0.01]
t=0:h:1;
clear w q
w (1)=1; % Euler?s method vector
q (1)=1; % Taylor method vector
for i=2: numel (t)
% Euler?s method
w(i)=w(i -1)+ h*f(t(i -1) ,w(i -1));
% Taylor method
q(i)=q(i -1)+ h*f(t(i -1) ,q(i -1))+ h ^2/2* df(t(i -1) ,q(i -1));
end
% put important results into a matrix
R=[R;h w(end) abs(exact -w(end )) q(end) abs(exact -q(end ))];
end
% R?s columns are h, EM approx., EM error, TM approx., TM error
R