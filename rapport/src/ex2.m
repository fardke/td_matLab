clf;
clear;

%Definition de l'intervalle de visualisation
n_min=-4;%borne min de l'intervalle de visualisation
n_max=9;%borne max de l'intervalle de visualisation
n=n_min:1:n_max;
% La reponse impulsionnelle du filtre est la soustraction de deux echellons * 2 * sin(n*pi/2)
filtre=(echelon(n,3).-echelon(n,-4)).*2.*sin(n*pi/2);
%on trace la reponse impulsionnelle sur l'intervalle de visualisation
stem(n,filtre);
title('Fonction de transfert du filtre');
axis([n_min,n_max]);
input('Figure suivante ?');
%Le signal d'entre est la soustraction de deux echelons * n/2
signal = (n./2).*(echelon(n,0).-echelon(n,-6));
%on trace le signal
stem(n,signal);
title('Signal discret d''entre');
axis([n_min,n_max]);
input('Figure suivante ?');

%Signal en sortie de filtre. On utilise le produit de convolution.
y=conv(signal,filtre);
stem(y);
title('Sortie du filtre');
axis([n_min,n_max]);
