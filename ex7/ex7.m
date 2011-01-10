% Exercice 7

clear
clf
fe = 44100 ; % Fréquence d’échantillonnage
Te = 1/fe ;

N=10240;

t_max=(N-1)*Te;
t_min=0;

t=t_min:Te:t_max;

%SON AUDIBLE
s1=2*sin(2*pi*1000*t) .+ 5*sin(2*pi*3000*t);
wavwrite(s1',fe,16,"sound_ex7_audible.wav");

%SON INAUDIBLE
s2=5*sin(2*pi*43100*t);
wavwrite(s2',fe,16,"sound_ex7_inaudible.wav");

%Spectre de s1
[S f]=TFD(s1,fe,N);
plot(f,abs(S));

input("Graphe suivant ?");

%Spectre de s2 échantilloné --> forcément il ya un pb (voir Shannon)
[S f]=TFD(s2,fe,N);
plot(f,abs(S));


