% Transformation d'une densité spectrale de puissance définie sur [0 1]
% en une densité définie sur [-fe/2, +fe/2]
% Si omis fe = 1
function [new_psd f] = psd_shift (psd, fe)
if (nargin() == 1)
	fe = 1 ;
	endif
	n = length(psd(:,1)) ;
	m = ceil(n/2) ;
	new_psd = psd([m+1:n, 1:m],2)/fe ;
	f = psd([m+1:n, 1:m],1) ;
	f(1:m) = f(1:m)-1 ;
	f = f*fe ;
endfunction

