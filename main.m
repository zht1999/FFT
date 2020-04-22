% xc=0:9;
% for i=1:10
%     xc(i)=1;
% end
N=18;
time_x=ones(N,1);
count=30;
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
        X=fft(x);
        %toc
        %tfft=cputime-start;
        tfft=toc(start);
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
         t(2,j)=tfft;
        % subplot(3,1,1);stem(x);
        % subplot(3,1,2);stem(abs(Xdef));
        % subplot(3,1,3);stem(abs(X));
    end
    time(i,1)=sum(t(1,:))/count;
    time(i,2)=sum(t(2,:))/count;
end
plot(time_x,time(:,1),'ro-');
hold on 
plot(time_x,time(:,2),'gx-');
legend('自定义FFT','系统FFT','location','northwest');
xlabel('点数');ylabel('时间（秒）');
title('FFT与自定义FFT性能比较');
set(gcf,'position',[0,0,1000,1000]);
saveas(gcf,'FFTvsFFT.jpg');
figure
plot(time_x,time(:,1)./time(:,2),'ro-');
xlabel('点数');ylabel('比值');
title('defFFT与FFT用时之比');
set(gcf,'position',[0,0,1000,1000]);
saveas(gcf,'FFTFFT比.jpg');
% hold on
% x=time_x;
% y=time(:,1);
% myfunc = inline('beta.*x.*x','beta','x');%三个参数分别为：函数模型(注意需要使用点除和点乘)，待定系数，自变量
% beta0 = 0.5;%待定系数的预估值
% beta = nlinfit(x,y,myfunc,beta0);%
% x=0:1:2^N;
% y=beta.*x.*x;
% plot(x,y);
% myfunc2 = inline('beta.*x.*log2(x)','beta','x');%三个参数分别为：函数模型(注意需要使用点除和点乘)，待定系数，自变量
% beta0 = 0.5;%待定系数的预估值
% beta = nlinfit(x,y,myfunc2,beta0);%
% %x=0:1:2^N;
% y=beta.*x.*log2(x);
% plot(x,y);