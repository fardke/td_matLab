% Etude du produit de convolution
% Transformée de Fourier et convolution
clear ;
clf ;
% Description de la porte, non nulle sur [0, 6]
debut_porte = -8 ;
fin_porte = 8 ;
M = fin_porte-debut_porte ;
n1 = -32 ;% Debut intervalle
n2 = 32 ;% fin intervalle
n = n2-n1+1 ;% Nombre de point
xn = n1:n2 ;% intervalle pour le stem
porte = zeros (1,n) ;% initialisation de l'ensemble des points  à 0
k1 = debut_porte-n1+1 ;% Interval ou notre courbe sera à 1. sinon elle sera à 0
k2 = fin_porte-n1+1 ;
porte(k1:k2) = 1 ;
% largeur de la porte
% signal retardé pour Octave
% Triangle = convolution de deux portes de largeur identique
%triangle = conv (porte, porte) ;
stem (xn, porte) ;
ylim ([0, 1.1]) ;
texte = sprintf ('Porte de largeur %d',M) ;
my_title (texte) ;

fplot = 2;
% transformee de fourrier
% TFD d'une porte : module (non affecté par le retard du signal
[Xp, fp] = TFD (porte, fplot, 512) ;
input ('Figure suivante ? ') ;
stem (fp, abs(Xp)) ;
ylim ([0, M+1]) ;
axis([0,0.5]) ;
texte = sprintf ('TFD d''une porte de largeur %d (module)',1);
my_title (texte) ;
my_xlabel ('Fréquence réduite') ;
