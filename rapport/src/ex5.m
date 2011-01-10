%Exercice 5
%Construisez une sinusoïde de fréquence 1 kHz échantillonnée à 10 kHz d’amplitude 1.
%Ajouter à celle-ci un bruit gaussien de moyenne nulle et d’amplitude 0.4.

clear ;
clf ;

fsig = 1000;	% fréquence du signal
fe = 10000 ;	% fréquence d'échantillonnage

T0 = 1/fsig ;
dt_plot = 1/fe ;
N=4096; %Nombre d’échantillon

tmin = 0 ;		%borne min de l'intervalle de visualisation
tmax = (N-1)*dt_plot ;	%borne max de l'intervalle de visualisation

t = tmin:dt_plot:tmax ;


x = sin(2*pi*fsig*t) ;
%X = fft (x) ;
plot (t, x) ;
axis([0 2*T0]);
my_title('Signal Sinus',25) ;
%print -deps "/home/rabgs/TPFINAL/td_matLab/rapport/fig/resEx5/fig_1_sinus.eps"

input('Afficher la sinusoide en appliquant le bruit');

% caracteristique du bruit gaussien
moy = 0; % moyenne 
ampl = 0.4; % amplitude du bruit
 
xB = x.+(moy+ampl*randn(1,N));
plot(t,xB);
axis([0 2*T0]);
my_title('Signal Sinus bruite',25) ;
%print -deps "/home/rabgs/TPFINAL/td_matLab/rapport/fig/resEx5/fig_2_sinusb.eps"



input('Creation du filtre passe bande');

Wp = [980 1020]/(fe/2); % borne inferieur de la bande passante
Ws = [50 1450]/(fe/2); % borne superieur de la bande passante
Rp = 3;
Rs = 40;
[n,Wn] = buttord(Wp,Ws,Rp,Rs); % calcule l'ordre du filtre Butterworth, ici nous faisons un filtre passe bande car Ws(1) < Wp(1) < Wp(2) < Ws(2)
[b,a] = butter(n,Wn);
%freqz(b,a,N,fe);
[H f] = freqz(b,a,N,fe); % Genere le filtre butterworth
plot(f,abs(H));
my_title('Filtre passe-bande',25) ;
xlim([900,1100]); %intervalle de visualisation
%print -deps "/home/rabgs/TPFINAL/td_matLab/rapport/fig/resEx5/fig_3_passbande.eps"


input('Afficher la transformé de fourier de la sinusoide bruité');

clf;
hold on;
%xBF = fft(xB);
[xBF f] = TFD(xB, fe, N);
plot(f,abs(xBF));
my_title('Transforme de fourier du Signal Sinus bruite',25) ;
xlim([900,1100]); %intervalle de visualisation
%print -deps "/home/rabgs/TPFINAL/td_matLab/rapport/fig/resEx5/fig_4_fftsinusb.eps"
hold off;


input('Application du filtre passe bande');
y=filter(b,a,xB); % on applique le filtre genere precedemment a la courbe
[yF f] = TFD(y, fe, N);
plot(f,abs(yF));
my_title('Signal Sinus bruité puis filtre',25) ;
xlim([900,1100]); %intervalle de visualisation
%print -deps "/home/rabgs/TPFINAL/td_matLab/rapport/fig/resEx5/fig_5_sinus-b.eps"

% 1/ Dans notre cas nous utiliserons un filtre pass-bande donc notre condition est Ws(1) < Wp(1) < Wp(2) < Ws(2) sachant que notre signal est à 1khz on choisit respectivement Ws(1)=50 < Wp(1)=980 < Wp(2)=1020 < Ws(2)=1450 .

% 2/ En comparant la courbe de la transformation de fourier du signal bruité et la courbe du signal bruité filtré on remarque que le bruit autour de la frequence 1KHz ( le pic de la courbe ) discorde moins la courbe et à donc été atténué .
