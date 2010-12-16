%Construisez une sinusoïde de fréquence 1 kHz échantillonnée à 10 kHz d’amplitude 1.
%Ajouter à celle-ci un bruit gaussien de moyenne nulle et d’amplitude 0.4.

clear ;
clf ;




% Fonction sinus

f0 = 1;		%fréquence du signal
fplot = 1000 ; % fréquence d'échantillonnage

T0 = 1./f0 ;

dt_plot = 1./fplot ;

tmin = 0 ;
tmax = 4*T0 ;

t = tmin:dt_plot:tmax ;
x = sin (2*pi*f0*t)/2 ;
X = fft (x) ;
plot (t, x) ;

% Choix des unités => amplitude A = 0.4 et période T = 1
A = 0.4 ;
T = 1 ;
