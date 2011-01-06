clear;
clf;

fe=8000;%frequence d'echantillonnage
fcut = 1000;%frequence de coupure
largeur = 200;%largeur de transition
N=1024;%Nombre de point qu'on veut calculer
n0=N/2;

Wp=(2*fcut)/fe;% borne inferieur de la bande passante
Ws=2*(fcut+largeur)/fe;%  borne superieur de la bande passante
[n Wn]=buttord(Wp,Ws,1,40);%calcul l'ordre du filtre Butterworth, ici nous faisons un filtre passe bas car Wp<Ws
[B A]= butter(n, Wn);%Genere le filtre butterworth
x = zeros(1,N) ;%on initialise les 1024 point de la courbe x a zeros
x(1) = 1 ;
y=filter(B,A,x);%on applique le filtre genere precedemment a la courbe

%Trace de la reponse impulsionnel
stem (y) ;
xlim([0,150]);
my_title('Reponse impulsionnelle',25) ;
%print -deps "/home/kewin/octave/td_matLab/rapport/fig/resEx4/repImpulsion.jpg"

%Pole/zero
input ("Figure suivante ? ") ;
zplane(B, A) ;%on trace les poles et zeros 
my_title('Zeros (o) et poles (x)',25); 
%print -deps "/home/kewin/octave/td_matLab/rapport/fig/resEx1/tfd.jpg"

% Fonctions de transfert avec freqz
input ('Figure suivante ? ') ;
[H f] = freqz (B,A) ;
plot (f,20*abs(H),'b');
xlim([0,1]);
my_title ('Fonction de transfert', 25) ;
%print -deps "/home/kewin/octave/td_matLab/rapport/fig/resEx4/fctTransfert.jpg"

% Signal constitue par la somme de deux sinusoides
input ('Figure suivante ? ') ;
Te = 1/fe;%Periode d'echantionnalle
fe1=800;%Frequence de la premiere sinusoide
fe2 = 1400;%Frequence de la seconde sinusoide
t=(0:N-1)*Te;
x1=sin(2*pi*fe1*t);% Definition de la premiere sinusoide
x2=sin(2*pi*fe2*t);% Definition de la seconde sinusoide
X=x1.+x2;%On ajoute chaque valeur de chaque sinusoide une a une
plot(X);% On trace la somme des deux sinusoide
xlim([0,1000]);
my_title ('Somme de deux sinusoides') ;
%print -deps "/home/kewin/octave/td_matLab/rapport/fig/resEx4/2sin.jpg"

%Spectre du signal
input ('Figure suivante ? ') ;
fX=fft(X);%Calcul du spectre du signal via la tranforme rapide du signal
plot(abs(fX));
xlim([0,1100]);
my_title ('Spectre du signal',25) ;
%print -deps "/home/kewin/octave/td_matLab/rapport/fig/resEx4/spectreEntre.jpg"

%Spectre du signal filtre
input ('Figure suivante ? ') ;
FX=filter(B,A,X);%On applique le filtre au  signal
fFX = fft(FX);%on recupere son spectre
plot(abs(fFX));
xlim([0,1100]);
my_title ('Spectre du signal filtre',25) ;
%print -deps "/home/kewin/octave/td_matLab/rapport/fig/resEx4/spectreSortie.jpg"
