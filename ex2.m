clf;
clear;

%Definition de l'intervalle de visualisation
n_min=-4;%borne min de l'intervalle de visualisation
n_max=9;%borne max de l'intervalle de visualisation
n=n_min:1:n_max;
%La fonction de transfert du filtre est la soustraction de deux echellons * 2 * sin(n*pi/2)
filtre=(echelon(n,3).-echelon(n,-4)).*2.*sin(n*pi/2);
%on trace la fonction de transfer
stem(n,filtre);
my_title('Fonction de transfert du filtre',25);
axis([n_min,n_max]);
%print -deps "/home/kewin/octave/td_matLab/rapport/fig/resEx2/fctTransfert.eps"

input('Figure suivante ?');
%Le signal d'entre est la soustraction de deux echelons * n/2
signal = (n./2).*(echelon(n,0).-echelon(n,-6));
%on trace le signal
stem(n,signal);
my_title('Signal discret d''entre',25);
axis([n_min,n_max]);
%print -deps "/home/kewin/octave/td_matLab/rapport/fig/resEx2/signalEntree.eps"

input('Figure suivante ?');
%Reponse impulsionnelle
%Pour afficher la reponse impulsionnelle du filtre nous faisons un produit de convolution entre un dirac et le filtre
dirac=zeros(1,length(n));
dirac(abs(n_min)+1)=1;
y=conv(dirac,filtre);
stem(y);
my_title('Reponse impulsionnelle du filtre',25);
axis([n_min,n_max]);
%print -deps "/home/kewin/octave/td_matLab/rapport/fig/resEx2/repImpulsionnelle.eps"

input('Figure suivante ?');
%Signal en sortie de filtre. On utilise le produit de convolution.
y=conv(signal,filtre);
stem(y);
my_title('Sortie du filtre',25);
axis([n_min,n_max]);
%print -deps "/home/kewin/octave/td_matLab/rapport/fig/resEx2/sortieFiltre.eps"
