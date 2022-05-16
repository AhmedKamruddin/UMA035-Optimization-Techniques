clc
clear
sd=[2 10 4 5; 6 12 8 11; 3 9 5 7];
a=[12; 25; 20];
b=[25 10 15 5];

mat=sd
%Balance the matrix
if sum(a)~=sum(b)
  if sum(a)>sum(b)
    mat=[mat zeros(1,size(mat, 1))'];
    b=[b sum(a)-sum(b)];
  elseif sum(a)<sum(b)
    mat=[mat; zeros(1,size(mat, 2))];
    a=[a; sum(b)-sum(a)];
  end
end

m=size(mat, 1);
n=size(mat, 2);


for k=1:m+n-2
%for k=1:2
  k
  %Find min cost (c) in SD and it's index (p,q)
  [c p]=min(sd)
  c(find(c==0))=[];
  p=p(find(c==min(c)));
  c=c(find(c==min(c)));
  q=find(c==mat(p, :));
  x=min( a(p), b(q) );

  if(size(mat, 1)>1 | size(mat, 2)==1)
    if x==a(p)
      b(q)=b(q)-x;
      a(p)=[];
      mat(p, :)=[]
      sd(p, :)=[]
    elseif x==b(q)
      a(p)=a(p)-b(q);
      b(q)=[];
      mat(:, q)=[]
      sd(:, q)=[]
    end
  %else
  end
end
