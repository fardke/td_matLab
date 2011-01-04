clear;
clf;

f0 = 1;% Unité de fréquence
T0 = 1/f0;% Unité de temps

a = 8;% 1/2 largeur de la porte
Dt = a*T0;
A = 1;%hauteur de la porte
t_min = -32*T0;%borne inférieure de l'intervalle de visualisation
t_max = 32*T0;%borne supérieure
t = t_min:1:t_max;%ensemble des valeur de t que l'on va calculer
n = 512;% Nombre de points
s = zeros(1,n);% on initialise l'ensemble des points à zéros
s(512/2-a:512/2+a) = 1;%les valeurs entre -8 et 8 notre porte vaut 1

h = stem(-255:256, s);%on trace tous les points de s entre -255 et 256
xlim([t_min t_max]);%les x sont compris entre t_min et t_max
my_title('Signal porte de largeur 16 et d''amplitude 1');

input('Figure suivante ? ');

[x, f] = TFD(s, 1, 512);%on calcul la transformé de fourier de pour les 512 points
fig = stem(f, abs(x));%on trace la valeur absolu de la transformé de fourier
xlim([0 0.5]);%sur l'intervalle 0 0.5
my_title('Transformee de fourier de la porte sur l''intervalle [0,0.5]') ; 

