function F=F(z);

global C; 
global n; 
global x;
global y; 
global c;

w=z(1:2); b=z(3);
S=0;
for i=1:n,
    S=S+max(0,1-c(i)*(w'*[x(i); y(i)]+b))^2;
end;
F=C*S+norm(w)^2;