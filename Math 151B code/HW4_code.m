 a = 0;
 b = 1;
 h = 0.1;
 f = @(t,y,v) v;
 F = @(t,y,v) 4*y + 6*exp(-t);
 t = a:h:b;

y(1) = 0;
v(1) = 0;

 for i=2:length(t)
    
     k1 = F(t(i-1),y(i-1));
     k2 = F(t(i-1)+(h/2), y(i-1)+(h/2)*k1);
     y(i) = y(i-1) + h*k2;
     k3 = F(t(i),y(i));
     y(i) = y(i-1) + (h/2)*(k3 + F(t(i-1),y(i-1)));
 end
 
 y(size(y))