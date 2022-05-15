clc
clear
f=@(x) (x<1/2).*(( 1-x)/2 ) + (x>=1/2).*(x^2);
L=-1;
R=1;
n=6;

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

