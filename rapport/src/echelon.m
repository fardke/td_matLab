% Fonction qui cree un echelon
% =============================================================
% n = ensemble des points sur lesquels on veut tracer l'echelon
% dec = decalage qu'on souhaite appliquer a l'echelon unite
% E(n) = u(n+dec)
% E(-dec) = u(0) = 1
% E(n) = 0 ssi n < -dec
% E(n) = 1 ssi n >= dec
function [E] = echelon(n,dec)
N = length(n);
E = zeros(1,N);
for i=(1-dec)+abs(min(n)):N
	E(i)=1;
endfor
endfunction
