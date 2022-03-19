clc
clear
M=10^10;
toChange=[1; 1];
C=[-3; -5];
minFlag=1
A=[1, 3; 1 1];
B=[3; 2];

n=size(A, 1);
c1=find(toChange(:)==1);
temp1=eye(n);
temp2=eye(n);
temp1(:, c1)=-1*temp1(:, c1);
artVar=temp2(:, c1)
d=zeros(1, n);

for i=size(d, 2)+1:size(d, 2)+size(artVar, 2)
  d(i)=-M;
end
d(end+1)=0;


t=[C' d];
mat=[A(:, :) temp1(:, :) artVar(:, :) B(:, :)];
for i=1:n
    for j=1:size(mat, 2)
      i;
      j;
      mat(:, j);
      temp2(:, i); 
      if mat(:, j)==temp2(:, i);
        bv(i)=j;
      end
    end
end


ZjCj=t(bv)*mat-t;

while true
  ZC=ZjCj(1:end-1);
  if ZC>=0
    break
  end


  enteringVar=find(ZC==min(ZC));

  ratio=[mat(:, end)./mat(:, enteringVar)];
  ratio(find(ratio<0))=inf;
  leavingVar=find(ratio==min(ratio));
  if size(leavingVar, 1)>1
    leavingVar=leavingVar(1:1);
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
 
end

soln=zeros(1, size(mat, 2)-1);
soln(bv)=mat(:, end);
  
t=t(1:end-1);
Z=soln*t'
finalTable=[soln(:, :) Z]

if minFlag==1
  finalTable(end)=finalTable(end)*-1;
end


table1=array2table(finalTable);
table1.Properties.VariableNames(1:size(finalTable, 2))={'x1', 'x2', 's1', 's2', 'A1', 'A2', 'max(Z)'}
