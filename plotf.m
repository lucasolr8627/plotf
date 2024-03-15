%% plotf - plot espectro de frequência

% descrição dos parâmetros
% X: vetor real
% fa: frequência de amostragem
%
% retorno: n/a

function plotf(X, fa)
    % numero de amostras
    N = length(X);
    % potencia de 2 mais proxima melhora a performance da fft
    N = pow2(nextpow2(N));
    % calcula a fft do sinal
    X_fft = fft(X, N);
    % normalização
    A_X1 = abs(X_fft) / N;
    % separa primeira metade e concentra o espectro
    A_X2 = A_X1(1:floor(N/2));
    A_X2(2:end-1) = 2*A_X2(2:end-1);
    % faixa de frequência dos harmonicos
    s = (0:length(A_X2) - 1) * (fa/N);
    % plot
    plot(s, A_X2);
end
