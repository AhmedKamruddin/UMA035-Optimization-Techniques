clc
clear
A=[1, 1, -1, 3; 5, 1, 4, 15];
B=[15; 12];
C=[1; 2; -1; 1];
n=size(A, 2);
m=size(A, 1);

if n<m
   return
end

nCm=nchoosek(n,m);
pair=nchoosek(1:4, m);

soln=[]
k=1
for i=1:nCm
  P=[ A(:, pair(i, 1)) A(:, pair(i, 2)) ]
  if det(P)~=0
    X=inv(P)*B
    if all(X>=0 & X~=inf)
      soln(k, pair(i, 1))=X(1)
      soln(k, pair(i, 2))=X(2)
      k=k+1;
    end
  end
end 

if isempty(soln)
  disp('No solution')
  return
  end
soln'
Z=soln*C

[maxValue maxIndex]=max(Z);
matrix=[soln(maxIndex, :) maxValue]

table1=array2table(matrix);

table1.Properties.VariableNames(1:size(matrix, 2))={'x1', 'x2', 'x3', 'x4', 'max(Z)'}
