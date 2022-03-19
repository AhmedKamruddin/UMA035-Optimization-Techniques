clc
clear all
A=[2 4;3 5];
b=[8;15];
y=0:1:10;

x11=(b(1)-A(1,1)*y)/A(1,2);
x21=(b(2)-A(2,1)*y)/A(2,2);
x11=max(0, x11);
x21=max(0, x21);
plot(y,x11,'r',y,x21,'b')
title('Graphical Method')
xlabel('x2')
ylabel('x1')

c1=find(y==0);
c2=find(x11==0);
line1=[ y(:, [c1, c2]); x11(:, [c1, c2]) ]';

c1=find(y==0);
c2=find(x21==0);
line2=[ y(:, [c1, c2]); x21(:, [c1, c2]) ]';

cornerpts=unique( [line1; line2], 'rows')

pt=[ ; ];
for i=1:size(A, 1)
  A1=A(i, :);
  b1=b(i, :);
  for j=i+1:size(A, 1)
    A2=A(j, :);
    b2=b(j, :);
    P=[A1; A2];
    Q=[b1; b2];
    X=P\Q
    if X(:)>=0
      pt=[pt, X]
    end
  endfor
endfor

allpts=unique( [pt'; cornerpts], 'rows')

PT=constraint1(allpts)
%PT=constraint2(allpts)
%PT=constraint3(allpts)

if isempty(PT)
  disp('No common region')
  return
endif

P=unique(PT, 'rows')

%Find max/min
x1=P(:, 1);
x2=P(:, 2);
for i=1:size(P, 1)
  sum(i)=3*P(i, 1) + 2*P(i, 2);
endfor

c1=find(sum==max(sum));
c2=find(sum==min(sum));

disp('MAX')
disp('Optimal solution');
disp(P(c1, :))  %Optimal solution
disp('Optimal value');
disp(max(sum))   %Optimal value

disp("\nMIN")
disp('Optimal solution');
disp(P(c2, :))  %Optimal solution
disp('Optimal value');
disp(min(sum))   %Optimal value
