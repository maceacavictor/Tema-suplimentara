%pe baza temei 2 calculul coeficientilor seriei Fourier
%trigonometrice ck si sk si reconstruirea semnalului cu ajutorul acestor
%coeficienti
%x(t)=c0/2+Suma(de la k=1 la infinit)(ck*cos(kwt) + sk*sin(kwt))
T=40; % perioada
D=13; % durata
N=15; %numarul oscilatiilor pe o perioada
A=1; %amplitudinea
t=-100:0.01:100;
w=2*pi/T; %pulsatia
x=0;
y=square(2*pi/T*t,D/T*100);
c=zeros(size(N+1)); %am creat un vector pentru am memora coeficientii ck
s=zeros(size(N+1)); %am creat un vector pentru am memora coeficientii sk
for k=0:1:N;
    f1=@(t) A.*cos(k*w*t);    
    f2=@(t) (-A).*cos(k*w*t);
    g1=@(t) A.*sin(k*w*t);    
    g2=@(t) (-A).*sin(k*w*t);
    % f1, f2, g1, g2 - functiile din interiorul integralelor
    c(k+1)=2/T*(integral(f1,0,D)+integral(f2,D,T)); %expresia coef ck
    s(k+1)=2/T*(integral(g1,0,D)+integral(g2,D,T)); %expresia coef sk
    if k==0
        x=x+c(k+1)/2;
    else
    x=x+c(k+1)*cos(k*w*t)+s(k+1)*sin(k*w*t);
    end
end
plot(t, y, t, x); 
title('Semnalul (linie albastra) si semnalul reconstruit (linie portocalie)')
%OBSERVATIE!
%acel "+1" de la c(k+1) respectiv s(k+1) l-am pus deoarece in vectorul c si
%s nu exita elementele c(0) si s(0), astfel elementele sunt "decalate cu
%+1". Daca se doreste un anumit coeficent trebuie scazut 1 din indicele acestuia !!!!