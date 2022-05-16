clc
clear
Cost=[2 10 4 5; 6 12 8 11; 3 9 5 7];
A=[12 25 20];
B=[25 10 15 5];

if sum(A)<sum(B)
  Cost(end+1, :)=zeros(1, size(Cost, 2))
  A=[A sum(B)-sum(A)]
elseif sum(A)>sum(B)
  Cost(:, end+1)=zeros(1, size(Cost, 1))
  B=[B sum(A)-sum(B)]
end

ICost=Cost;
X=zeros(size(Cost))
[m, n]=size(X)
BFS=m+n-1;
for i=1:size(Cost, 1)
  for j=1:size(Cost, 2)
    hh=min(Cost(:));
    [rowInd, colInd]=find(Cost==hh);
    x11=min(A(rowInd), B(colInd));
    [val, ind]=max(x11);
    ii=rowInd(ind);
    jj=colInd(ind);
    y11=min(A(ii), B(jj));
    X(ii, jj)=y11;
    A(ii)=A(ii)-y11;
    B(jj)=B(jj)-y11;
    Cost(ii, jj)=inf;
  end
end
TotalBFS=length(nonzeros(X));
if TotalBFS==BFS
  disp('Non Degenerate');
else
  disp('Degenerate');
end
X
InitialCost=sum(sum(ICost.*X))

