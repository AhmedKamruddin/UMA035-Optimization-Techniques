clc
clear
M=1;
toChange=[1; 1; 1];
C=[-12; -10];
minFlag=1;
A=[5, 1; 6, 5; 1, 4];
B=[10; 30; 8];

n=size(A, 1);
m=size(A, 2);
c1=find(toChange(:)==1);
temp1=eye(n);
temp2=eye(n);
temp1(:, c1)=-1*temp1(:, c1);
artVar=temp2(:, c1);
d=zeros(1, n+m);


for i=size(d, 2)+1:size(d, 2)+size(artVar, 2)
  d(i)=-M;
end
d(end+1)=0;


t=[d];

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
  if ZC>=0 | ( ZC>=-10^-15 & ZC<=-10^-20)
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


%PHASE 2
d=zeros(1, n+1);
t=[C' d];
matEnd=mat(:, end);
mat= mat(:, 1:end-size(artVar, 2)-1);
mat=[mat matEnd];

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
table1.Properties.VariableNames(1:size(finalTable, 2))={'x1', 'x2', 's1', 's2', 's3', 'min(Z)'}
