clear;
clf;

f0 = 1;% Unite de frequence
T0 = 1/f0;% Unite de temps

a = 8;% 1/2 largeur de la porte
Dt = a*T0;
A = 1;%hauteur de la porte
t_min = -32*T0;%borne inferieure de l'intervalle de visualisation
t_max = 32*T0;%borne superieure
t = t_min:1:t_max;%ensemble des valeur de t que l'on va calculer
n = 512;% Nombre de points
s = zeros(1,n);% on initialise l'ensemble des points a zeros
s(512/2-a:512/2+a) = 1;%les valeurs entre -8 et 8 notre porte vaut 1

h = stem(-255:256, s);%on trace tous les points de s entre -255 et 256
xlim([t_min t_max]);%les x sont compris entre t_min et t_max
my_title('Signal porte de largeur 16 et d''amplitude 1',25);
%print -deps "/home/kewin/octave/td_matLab/rapport/fig/resEx1/signalPorte.eps"

input('Figure suivante ? ');

[x, f] = TFD(s, 1, 512);%on calcul la transforme de fourier de pour les 512 points
fig = stem(f, abs(x));%on trace la valeur absolu de la transforme de fourier
xlim([0 0.5]);%sur l'intervalle 0 0.5
my_title('Transformee de fourier de la porte sur l''intervalle [0,0.5]', 25) ; 
%print -deps "/home/kewin/octave/td_matLab/rapport/fig/resEx1/tfd.eps"
