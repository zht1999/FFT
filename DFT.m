%DTFT子函数
function X = DFT(x)
k=0:(length(x)-1);
n=0:(length(x)-1);
X=x*(exp(-1i*2*pi/length(x)).^(n'*k));
end
%FFT子函数
