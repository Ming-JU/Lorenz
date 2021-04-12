clc;clear;
x = 0:0.1:10;
y = 0:0.1:10;
z = 0:0.1:10;

[X,Y,Z] = meshgrid(x,y,z);
U = Y-Z;
V = X.*(28-Z)-Y;
W = X.*Y-8/3*Z;

h = 0.01;
iter = 1000;
xx = zeros(1,iter+1);
yy = zeros(1,iter+1);
zz = zeros(1,iter+1);
xx(1) = 1;
yy(1) = 1;
zz(1) = 1;

for j = 1:iter
    [k1,l1, t1] = RK4(xx(j),yy(j),zz(j));
    [k2,l2, t2] = RK4(xx(j)+(h/2)*k1 , yy(j) + (h/2)*l1,zz(j) + (h/2)*t1);
    [k3,l3, t3] = RK4(xx(j)+(h/2)*k2 , yy(j) + (h/2)*l2,zz(j) + (h/2)*t2);
    [k4,l4, t4] = RK4(xx(j)+h*k3 , yy(j) + h*l3,zz(j) + h*t3);
    
    xx(j+1) = xx(j)+(h/6)*(k1+2*k2+2+k3+k4);
    yy(j+1) = yy(j) + (h/6)*(l1+2*l2+2*l3+l4);
    zz(j+1) = zz(j) + (h/6)*(t1+2*t2+2*t3+t4);
end



