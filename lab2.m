pkg load signal;
load sound.mat

fs=176400;
T = 1/fs;
fc=20000

N =length(m)
t=(0:N-1)*T;
c= cos(2*pi*fc.*t);
figure;
subplot(3,1,1);
plot(t,m);
grid on;

subplot(3,1,2);
plot(t,c);
grid on;

subplot(3,1,3);
s=m.*c;
plot(t,s);
grid on;

figure;
subplot(3,1,1);
plot(t,m);
xlim([0.94 0.95]);
grid on;

plot(t,c);
xlim([0.94 0.95]);
grid on;

subplot(3,1,3);
s=m.*c;
plot(t,s,t,m);
xlim([0.94 0.95]);
grid on;

M = abs(fftlab(m))/N;
figure;
subplot(3,1,1);
plot(t,M);

C = abs(fftlab(c))/N;
subplot(3,1,2);
plot(t,C);

S= abs(fftlab(s))/N;
subplot(3,1,3);
plot(t,S);
f= linspace(-(fs/2),(fs/2),N)/1000;
figure;
subplot(3,1,1);
plot(f,M);
subplot(3,1,2);
plot(f,C);
subplot(3,1,3);
plot(f,S);

% fim do primeiro
v=s.*c;
fcorte = 12000/(fs/2);
h = fir1(2000,fcorte);
[H, fh] = freqz(h,1,N/2+1,fs/1000) ;
H = abs(H);
vo = filter(h,1,v);

V=abs(fftlab(v))/N;

figure;
subplot(4,1,1);
plot(f,S);
subplot(4,1,2);
plot(f,V);
subplot(4,1,3);
plot(fh,H);
subplot(4,1,4);
plot(f,vo);
xlim([0,50*1000])
