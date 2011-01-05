
clear
clf

load "TD_ESIL.mat";   % -> fe, A, B, x, y

t_max = length(x);

h = stem (1:1:t_max, x);	% allure temporelle de x
xlim([0 t_max]);
set_ylim(x) ;
text = sprintf ("Allure temporelle de x") ;
my_title (text, 13) ;

input("Figure suivante ?");

X = fft(x) ;
h = stem (1:1:t_max, abs(X));	% fft de x = spectre
xlim([0 t_max]);
set_ylim(abs(X)) ;
text = sprintf ("FFT de x") ;
my_title (text, 13) ;

input("Figure suivante ?");

t_max = length(y);
h = stem (1:1:t_max, y);	% allure temporelle de y
xlim([0 t_max]);
set_ylim(y) ;
text = sprintf ("Allure temporelle de y") ;
my_title (text, 13) ;

input("Figure suivante ?");

Y = fft(y) ;
h = stem (1:1:t_max, abs(Y));	% fft de y
xlim([0 t_max]);
set_ylim(abs(Y)) ;
text = sprintf ("FFT de y") ;
my_title (text, 13) ;

input("Figure suivante ?");

% Distribution de l'amplitude
[nn, xx] = hist(x, 30) ;
hist(x, 30) ;
my_title ('Distribution de l''amplitude du bruit gaussien',13) ;
hmax = max(nn) ;
xtext = 0.95*min(xx) ;
ylim ([0 1.05*hmax]) ;
b_moy = mean(x) ;
b_std = std(x) ;
b_var = var(x) ;
text = sprintf ('Moyenne = %.2f',b_moy) ;
my_text(xtext, 0.95*hmax,text) ;
text = sprintf ('Ecart type = %.2f',b_std) ;
my_text(xtext, 0.87*hmax,text) ;
text = sprintf ('Variance = %.2f',b_var) ;
my_text(xtext, 0.79*hmax,text) ;

input ('Figure suivante ? ') ;

% Densité spectrale de puissance
psd = spectral_xdf (x, "rectangle", 1/sqrt(length(x))) ;
[Sx f1] = psd_shift (psd, fe) ;
Sx = abs(Sx) ;
plot(f1, Sx) ;
hold on
fmin = min(f1) ;
fmax = max(f1) ;
plot([fmin fmax], [1/fe 1/fe]) ;
my_title ('Densite spectrale de puissance du bruit gaussien en entree',13) ;
set_ylim(Sx) ;
xlim([fmin fmax]);
hold off 
input ('Figure suivante ? ');

% Densité spectrale de puissance
psd = spectral_xdf (y, "rectangle", 1/sqrt(length(x))) ;
[Sy f2] = psd_shift (psd, fe) ;
Sy = abs(Sy) ;
plot(f2, Sy) ;
hold on
fmin = min(f2) ;
fmax = max(f2) ;
plot([fmin fmax], [1/fe 1/fe]) ;
my_title ('Densite spectrale de puissance du signal de sortie',13) ;
set_ylim(Sy) ;
xlim([fmin fmax]);
hold off 

input ('Figure suivante ? ');

clf
H1 = sqrt(Sy ./ Sx);				% allure de la fonction de transfert harmonique
[H2 f]= freqz(B, A);				% fonction de transfert définie par A et B
hold on
plot(f1, H1, C="r");
plot((f/(2*pi))*fe, abs(H2), C="b");
legend('A partir des densites spectrales', 'A partir des tableaux A et B', 'location', 'west');
xlim([0 500]);
set_ylim(H1) ;
my_title ('Fonctions de transfert',13) ;

hold off
