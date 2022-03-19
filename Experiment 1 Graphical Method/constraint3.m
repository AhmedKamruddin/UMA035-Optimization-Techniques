function output=constraint1(x)
  format rat

%for 1st constraint
x1=x(:, 1)
x2=x(:, 2)
cons1=round(2*x1+ 4*x2 - 8)
s1=find(cons1>0)
x(s1, :)=[]

%for 2nd constraint
x1=x(:, 1)
x2=x(:, 2)
cons2=round(3*x1+5*x2-15)
s2=find(cons2>0)
x(s2, :)=[]

output=x;