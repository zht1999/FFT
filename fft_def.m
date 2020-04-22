function x=fft_def(x)
%tic
N=length(x);
%xput=zeros(1:Nnew);
if(rem(log2(N),1)~=0)
    Nnew=2^(floor(log2(N))+1);
    new=zeros(1,Nnew-N);
    x=[x new];
    N=Nnew;
end

Nl=N;%个数
%xput=zeros(1:N);
Nn=1;%序列个数
% buffer=0;%交换值时需要一个缓存变量
Nh=N/2;%每个序列点个数
w=-1i*2*pi;
W=zeros(1,N/2-1);
W(1)=exp(w/Nl);
for i=2:N/2-1
    W(i)=W(1)*W(i-1);
end


%index=0;%索引
%toc
while(N>1)
%    tic
    for i=0:Nn-1
        for j=1:Nh
            up=i*N+j;
            down=up+Nh;
            buffer=x(up);
            x(up)=x(up)+x(down);
%             disp("up");
%             disp(up);
%            x(down)=x(up)-x(down)-x(down);
            x(down)=buffer-x(down);
%             disp("down");
%              disp(down);
%            x(down)=x(down)*exp(w*(j-1)/N);
%             disp(j-1);
%             disp(x(down));
           if((j-1)~=0) 
               index=(j-1)*Nn;
    %          disp(index-1);
%                 if(W(index)==0)
%                     W(index)=exp(w*index/Nl);
%                 end
                x(down)=x(down)*W(index);
           end
%             if(index~=1)
%                 x(down)=x(down)*W(index);
%             end
            
        end
    end
%    toc
    N=N/2;
%     disp("N");
%     disp(N);
    Nh=N/2;
    Nn=Nn*2;
end
%disp(Nl);
%  flag=ones(1,Nl);
% for i=1:Nl
%     first=i;
% %    next=bitreverse(log2(Nl),i-1)+1;
%     next=1;
%     if(first~=next&&flag(first)&&flag(next))
%         buffer=x(first);
%         x(first)=x(next);
%         x(next)=buffer;
%         flag(first)=0;
%         flag(next)=0;
%     end
% end
j1 = 0;
for i = 1 : Nl  
    if i < j1 + 1        
        tmp = x(j1 + 1);        
        x(j1 + 1) = x(i);        
        x(i) =tmp;    
    end
    k = Nl / 2;    
    while k <= j1        
        j1 = j1 - k;        
        k = k / 2;    
    end
    j1 = j1 + k;
end
 
end

