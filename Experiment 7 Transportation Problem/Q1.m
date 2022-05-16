clc;
clear all;
format short;
Cost=[2 10 4 5; 6 12 8 11; 3 9 5 7];
A=[12 25 20];%Rows
B=[25 10 15 5];%columns
if sum(A)==sum(B)
    fprintf('Given problem is balanced\n');
else
    fprintf('Given problem is unbalanced\n');
    if sum(A)<sum(B)
        Cost(end+1,:)=zeros(1,size(A,2));
        A(end+1)=sum(B)-sum(A);
    elseif sum(B)<sum(A)
        Cost(:,end+1)=zeros(1,size(A,2));
        B(end+1)=sum(A)-sum(B);
    end
end
ICost=Cost;
X=zeros(size(Cost));
[m,n]=size(Cost);
BFS=m+n-1;
for i=1:size(Cost,1)
    for j=1:size(Cost,2)
        hh=min(Cost(:));
        [rowind , colind]=find(hh==Cost);
        x11= min(A(rowind),B(colind));
        [val ,ind]=max(x11);
        ii=rowind(ind);
        jj=colind(ind);
        y11=min(A(ii),B(jj));
        X(ii,jj)=y11;
        A(ii)=A(ii)-y11;
        B(jj)=B(jj)-y11;
        Cost(ii,jj)=Inf;
    end
end
fprintf('Initial BFS=\n');
TotalBFS=length(nonzeros(X));
if TotalBFS==BFS
    fprintf('Initial BFS is Non degenerate \n');
else
    fprintf('Initial BFS is degenerate\n');
end
InitialCost=sum(sum(ICost.*X))
fprintf('Initial BFS Cost=%d\n',InitialCost);
