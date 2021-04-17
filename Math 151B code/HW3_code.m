f = @(t,y) 1 + y;
h = 0.2;
hmax = 0.6;
hmin = 0.1;
a = 0;
b = 1;
t = a:h:b;
w(1) = -0.5;
flag = 1;
TOL = 0.02;


while(flag == 1)
    k1 = h*f(t,w);
    k2 = h*f(t+(1/4).*h, w+(1/4).*k1);
    k3 = h*f(t+(1/8).*h, w+(3/32).*k1+(9/32).*k2);
    k4 = h*f(t+(12/13).*h, w+(1932/2197).*k1-(7200/2197).*k2+(7296/2197).*k3);
    k5 = h*f(t+h, w+(439/216).*k1-8.*k2+(3680/513).*k3-(845/4104).*k4);
    k6 = h*f(t+(1/2).*h, w-(8/27).*k1+2.*k2-(3544/2565).*k3+(1859/4104).*k4-(11/40).*k5);
    
    if(R < TOL)
        t = t + h;
        w = w + (25/216)*k1 + (1408/2565)*k3+(2197/4104)*k4-(1/5)*k5;
        t, w, h
    end
    d = 0.84*(TOL/R).^(1/4);
    
    if(d <= 0.1)
        h = 0.1*h;
    end
    if(d >= 4)
        h = 4*h;
    else
        h = d*h;
    end
    
   if(h > hmax)
       h = hmax;
   end
   
   if(t >= b)
       flag = 0;
   end
   
   if(t+h > b)
       h = b - t;
   end
   
   if(h < hmin)
       flag = 0;
   end
   
end