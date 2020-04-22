N=10;
time_x=ones(N,1);
count=20;
time=zeros(N,2);
for i=1:N
    %clear;
    t=zeros(2,5);
    n=0:2^i-1;
    time_x(i)=2^i;
    T=0.0001;

%    x=cos(6000*pi*n*T)+cos(1000*pi*n*T);
    x=ones(1,2^i);
%    x(1)=1;
    for j=1:count
        %t11=clock;
        start=tic;
        %start=cputime;
        X=DFT(x);
        %toc
        %tfft=cputime-start;
        tdft=toc(start);
        %t12=clock;
        %tdef=etime(t12,t11);
        %t11=clock;
        %tic
        %start=cputime;
        start=tic;
        Xdef=fft_def(x);
        %tdef=cputime-start;
        %toc
        tdef=toc(start);
        %t22=clock;
%         tfft=etime(t22,t11);
         t(1,j)=tdef;
         t(2,j)=tdft;
        % subplot(3,1,1);stem(x);
        % subplot(3,1,2);stem(abs(Xdef));
        % subplot(3,1,3);stem(abs(X));
    end
    time(i,1)=sum(t(1,:))/count;
    time(i,2)=sum(t(2,:))/count;
end
plot(time_x,time(:,1),'rx-');
hold on 
plot(time_x,time(:,2),'go-');
legend('自定义FFT','DFT','location','northwest');
xlabel('点数');ylabel('时间（秒）');
title('DFT与自定义FFT性能比较');
set(gcf,'position',[0,0,1000,1000]);
saveas(gcf,'DFTvsFFT.jpg');