clear ;
clf ;

f0 = 1 ;
T0 = 1/f0 ;
fplot = 200 ;
dt_plot = 1./fplot ;

a = 4 ;
% 1/2 largeur de la porte
Dt = a*T0 ;
A = 1 ;
% Hauteur de la porte
t_min = -32*T0 ;
t_max = 32*T0 ;
t = t_min:dt_plot:t_max ;
n = length(t) ;
s = zeros(1,n) ;
k1 = floor(-(Dt+t_min)*fplot) ;
k2 = ceil((Dt-t_min)*fplot) ;
s(k1:k2) = A*ones(1,k2-k1+1) ;
plot (t,s) ;
set_ylim (s) ;
text = sprintf ('Porte de largeur %.1f s et d''amplitude %.1f',2*Dt,A) ;
my_title (text, 13) ;
my_xlabel ('Temps (s)') ;
	
