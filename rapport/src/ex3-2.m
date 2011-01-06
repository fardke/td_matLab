clear
clf
%Coefficient du filtre etudie
A = [2 0] ;
B = [1 1] ;

fe = 1 ;                                % Frequence d'echantillonnage
[H, w] = freqz(B,A) ;                   % w : pulsation entre 0 et pi
nu = w/(2*pi) ;                         % Frequence reduite
f = nu*fe ;                             % Frequence

%On trace le diagramme de gain pour determiner la nature du filtre
plot(nu,20*log10(abs(H))) ;
my_title('Diagramme de gain en frequence reduite en db',25) ;

%print -deps "/home/kewin/octave/td_matLab/rapport/fig/resEx3/f2Gain.eps" 

input ('Figure suivante ?') ;
%Diagramme de phase
plot(nu,angle(H)) ;
my_title('Diagramme de phase en frequence reduite',25) ;
%print -deps "/home/kewin/octave/td_matLab/rapport/fig/resEx3/f2Phase.eps" 

input ('Figure suivante ? ') ;
%Zeros et poles
zplane(B, A) ;
my_title('Zeros et poles',25) ;
%print -deps "/home/kewin/octave/td_matLab/rapport/fig/resEx3/f2ZP.eps" 

%Reponse impulsionnelle
%Definition de l'intervalle de visualisation
N = 64 ;
n0 = N/2 ;
n_min = 1-n0 ;
n_max = N-n0 ;
n = n_min:1:n_max ;

%Definition du dirac
dirac = zeros(1,N);
dirac(n0) = 1;
y = filter(B,A,dirac);
input ('Figure suivante ?') ;
stem (n,y) ;
my_title('Reponse impulsionnelle',25) ;
%print -deps "/home/kewin/octave/td_matLab/rapport/fig/resEx3/f2Impulsion.eps" 

input ('Figure suivante ?') ;
%Reponse indicielle
%Definition de l'echelon
u = zeros(1,N) ;
for i=n0:N
	u(i)=1;
endfor
i = filter(B,A,u) ;
h_obj = stem (n,i) ;
my_title('Reponse indicielle',25) ;
%print -deps "/home/kewin/octave/td_matLab/rapport/fig/resEx3/f2Indice.eps" 

