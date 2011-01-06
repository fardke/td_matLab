clear
clf
fe = 1 ;
A = [2 -1] ;
B = [0 2] ;
[H, w] = freqz(B,A) ;
nu = w/(2*pi) ;
f = nu*fe ;

% Réponse impulsionnelle
N = 64 ;
n0 = N/2 ;
n_min = 1-n0 ;
n_max = N-n0 ;
n = n_min:n_max ;
d = zeros(1,N) ;
d(n0) = 1 ;
h = filter(B,A,d) ;
input ("Figure suivante ? ") ;
h_obj = stem (n,h) ;
set_ylim(h) ;
set (h_obj, 'markersize', 5) ;
my_title("Réponse impulsionnelle", 13) ;
% Réponse indicielle
u(1:n0-1) = zeros(1,n0-1) ;
u(n0:N) = ones(1,N-n0+1) ;
i = filter(B,A,u) ;
input ("Figure suivante ? ") ;
h_obj = stem (n,i) ;
set_ylim(i) ;
set (h_obj, 'markersize', 5) ;
my_title("Réponse indicielle", 13) ;

