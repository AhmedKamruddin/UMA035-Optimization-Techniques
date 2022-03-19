clc
clear
C=[3/4; -20; 1/2; -6];
A=[1/2 -8 -1 9; 1/2 -12 -1/6 3; 0 0 1 0];
B=[0; 0; 1];
n=size(A, 1);
temp1=eye(n);
d=zeros(1, n+1);

t=[C' d]
mat=[A(:, :) temp1(:, :) B(:, :)]
bv=size(A, 2)+1:size(mat, 2)-1

ZjCj=t(bv)*mat-t;

while true
  ZC=ZjCj(1:end-1)
  if ZC>=0
    break
  end


  enteringVar=find(ZC==min(ZC))
  if size(enteringVar, 2)>1
    enteringVar=enteringVar(1:1)
  end

  ratio=[mat(:, end)./mat(:, enteringVar)];
  ratio(find(ratio<0))=inf;
  leavingVar=find(ratio==min(ratio));
  if size(leavingVar, 1)>1
    leavingVar=leavingVar(1:1)
  end

  bv(find(bv==bv(leavingVar)))=enteringVar;

  k=mat(leavingVar, enteringVar);
  mat(leavingVar, :)=mat(leavingVar, :)/k;
  for i=1:size(mat, 1)
    if i~=leavingVar
      mat(i, :)=mat(i, :) - mat(i, enteringVar)*mat(leavingVar, :);
    end
  end
  ZjCj=ZjCj-ZjCj(enteringVar)*mat(leavingVar, :);
  mat
 
end
  bv;
  soln=zeros(1, size(mat, 2)-1);
  soln(bv)=mat(:, end);
  
t=t(1:end-1);
Z=soln*t'
finalTable=[soln(:, :) Z]

table1=array2table(finalTable);

table1.Properties.VariableNames(1:size(finalTable, 2))={'x1', 'x2', 's1', 's2', 'max(Z)'}




