clc
clear
A=[-1, 1, 1, 0; 1, 1, 0, 1];
B=[1; 2];
C=[1; 2; 0; 0];
n=size(A, 2);
m=size(A, 1);

if n<m
   return
end

nCm=nchoosek(n,m);
pair=nchoosek(1:4, m);

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

table1.Properties.VariableNames(1:size(matrix, 2))={'x1', 'x2', 's1', 's2', 'max(Z)'}
