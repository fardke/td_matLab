%Transformé de Fourier discrète avec spectre centré
%==================================================
function [X,freq] = TFD(x,fe,N)
if(nargin() == 2)
	N = length(x);
endif

if mod(N,2)==0
	k = -N/2:N/2-1; %N pair
else
	k = -(N-1)/2:(N-1)/2; %N impair
endif

T = N/fe;
freq = k/T;
X = fft(x,N);
X = fftshift(X);

endfunction
