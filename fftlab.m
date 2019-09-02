function G=fftlab(g);
N = length(g); %tamanho do vetor g
G1 = fft(g); % TF de g.
G= fftshift(G1); % obter espectro negativo e positivo;
