% Exercice 7

clear
clf

fe = 44100 ; % Frequence d echantillonnage

dt_plot = 1/fe ; 

N=10240; %Nombre d echantillon

t_max=(N-1)*dt_plot;  	%borne max de l'intervalle de visualisation
t_min=0; 		%borne min de l'intervalle de visualisation

t=t_min:dt_plot:t_max;

%SON AUDIBLE
s1=2*sin(2*pi*1000*t) .+ 5*sin(2*pi*3000*t);
wavwrite(s1',fe,16,"sound_ex7_audible.wav");

%SON INAUDIBLE
s2=5*sin(2*pi*43100*t);
wavwrite(s2',fe,16,"sound_ex7_inaudible.wav");

%Spectre de s1 ( son audible )
[S f]=TFD(s1,fe,N);
plot(f,abs(S));
my_title('Spectre S1 : Signal audible',25) ;
xlim([-4000,4000]); %intervalle de visualisation
%print -deps "/home/rabgs/TPFINAL/td_matLab/rapport/fig/resEx7/s1_audible.eps"

input("Spectre de s2 ( son inaudible ) ?");

%Spectre de s2 ( son inaudible )
[S f]=TFD(s2,fe,N);
plot(f,abs(S));
my_title('Spectre S2 : Signal audible',25) ;
xlim([-4000,4000]); %intervalle de visualisation
%print -deps "/home/rabgs/TPFINAL/td_matLab/rapport/fig/resEx7/s2_inaudible.eps"

