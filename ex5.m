%Construisez une sinusoïde de fréquence 1 kHz échantillonnée à 10 kHz d’amplitude 1.
%Ajouter à celle-ci un bruit gaussien de moyenne nulle et d’amplitude 0.4.

clear ;
clf ;

% Fonction sinus

f0 = 1000;		%fréquence du signal
fplot = 10000 ; % fréquence d'échantillonnage

T0 = 1./f0 ;

dt_plot = 1./fplot ;

tmin = 0 ;
tmax = 10*T0 ;

t = tmin:dt_plot:tmax ;
N = length(t) ;
x = (sin (2*pi*f0*t)/2) ;
%X = fft (x) ;
plot (t, x) ;
input('Afficher la sinusoide en appliquant le bruit');
moy = 0;
ampl = 0.4;
xB = x.+(moy+ampl*randn(1,N));
plot(t,xB);
input('Afficher la transformé de fourier de la sinusoide bruité');
clf;
hold on;
xBF = fft(xB);
xF = fft(x);
plot(t,xF,'r');
plot(t,xBF);
hold off;

input('Application du filtre passe bande');
f1 = 0.4;
f2 = 0.1;
fe = 1;
bw(1) = 2*f2/fe ;
bw(2) = 2*f1/fe ;
h4 = fir1 (N,bw,'blackman');
H4 = freqz(h4);
plot(t, abs(H4));
