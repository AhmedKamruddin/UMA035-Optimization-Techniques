clc
clear
f=@(x) (x*(x-2));
L=0;
R=1.5;
n=4;

F=[1 1];
for i=3:n
  F(i)=F(i-1)+F(i-2);
end

for k=1:n-2
  ratio=F(n-k-1)/F(n-k+1);
  x1=L+ratio*(R-L);
  x2=R-ratio*(R-L);

  if f(x1)<f(x2)
    R=x2;
  elseif f(x1)>f(x2)
    L=x1;
  end

end


c=(x1+x2)/2

f(c)

