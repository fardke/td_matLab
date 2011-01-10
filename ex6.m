%
clear
clf

load "TD_ESIL.mat";% Dans le fichier matLab on recupere la var fe, et les tableaux A,B,x,y

%Recuperation de la longueure des tableau x,y
x_max = length(x);%taille de x
y_max = length(y);

%Allure temporelle de X
h = stem (1:1:x_max, x);% affichage de l'allure temporelle de x
xlim([0 x_max]);%intervalle de visualisation
set_ylim(x) ;
my_title ('Allure temporelle de x') ;

input("Figure suivante ?");
%Spectre de X
spectreX = fft(x) ;%on recupere le spectre de l'echantillon x par la transformee rapide de fourrier
h = stem (1:1:x_max, abs(spectreX));%on trace
xlim([0 x_max]);%intervalle de visualisation
set_ylim(abs(spectreX)) ;
my_title ('Spectre de x') ;

input("Figure suivante ?");
%Allure temporelle de Y // on fait pareil qu'avec y
h = stem (1:1:y_max, y);% affichage de l'allure temporelle de y
xlim([0 y_max]);
set_ylim(y) ;
my_title ('Allure temporelle de y') ;

input("Figure suivante ?");
%Spectre de Y // On fait pareil qu'avec x
spectreY = fft(y) ;
h = stem (1:1:y_max, abs(spectreY));	% fft de y
xlim([0 y_max]);
set_ylim(abs(spectreY)) ;
my_title ('Spectre de y') ;

input("Afficher caracteristique de x ?");
% Caracteristique du signal x
moye = mean(x) ;%calcul de la moyenne du signal
ecarT = std(x) ;%calcul de l'ecart type
vari = var(x) ;%calcul de la variance
printf ('Moyenne = %.2f\n',moye) ;
printf ('Ecart type = %.2f\n',ecarT) ;
printf ('Variance = %.2f\n',vari) ;

input ('Figure suivante ? ') ;
% Densite spectrale de puissance
psd = spectral_xdf (x, "rectangle", 1/sqrt(x_max)) ;%on recupere la densite spectrale par la fonction spectral_xdf du paquet signal
[psdX fX] = psd_shift (psd, fe) ;%la densite spectrale ete definie sur 0 1 on la definie sur le fe qu'on a recupere dans le fihcier matlab charge
plot(fX, abs(psdX)) ;
hold on
plot([min(fX) max(fX)], [1/fe 1/fe]) ;
my_title ('Densite spectrale du signal x') ;
set_ylim(psdX) ;
xlim([min(fX) max(fX)]);
hold off 

input ('Figure suivante ? ');
% Densite spectrale de puissance
psd = spectral_xdf (y, "rectangle", 1/sqrt(y_max)) ;%on recupere la densite spectrale de y dans une fenetre rectangle
[psdY fY] = psd_shift (psd, fe) ;%la densite spectrale ete definie sur 0 1 on la definie sur le fe qu'on a recupere dans le fihcier matlab charge
plot(fY, abs(psdY)) ;
hold on
plot([min(fY) max(fY)], [1/fe 1/fe]) ;
my_title ('Densite spectrale du signal y') ;
set_ylim(abs(psdY)) ;
xlim([min(fY) max(fY)]);
hold off 

input ('Figure suivante ? ');
%Allure de fonction de transfert en harmonique compare a la fonction de tranfert definie par A et B
clf
tXY = sqrt(psdY ./ psdX);%fonction de transfert en harmonque du filtre : densite spectral en sortie / densite spectrale en entree
[tAB f]= freqz(B, A);% fonction de transfert definie par A et B
hold on
plot(fX, tXY, C="g");
plot((f/(2*pi))*fe, abs(tAB));
legend('Fonction de transfert harmonique du filtre', 'Fonction de transfert definie par A et B', 'location', 'west');
xlim([0 500]);
set_ylim(tXY) ;
my_title ('Fonctions de transfert') ;
hold off
