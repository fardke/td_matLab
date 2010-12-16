% signal_rect (t, t0, T, r) (04/11/2010)
% ======================================
% Génère un signal rectangulaire de période T,
% de rapport cyclique r,
% dont un front montant se situe à t0
function s = signal_rect (t, t0, T, r)
n = length(t) ;
s = zeros(1,n) ;
for i = 1:n
x = floor((t(i)-t0)/T) ;
x = (t(i)-t0)-(x*T) ;
x = x/T ;
if (x<=r)
s(i) = 1 ;
endif
endfor
endfunction

