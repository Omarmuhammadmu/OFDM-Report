%{
* Funtion description:
  -- Arguments --
    Inputs:
            x_n : Sampled singal in time domain
            N   : Number of samples in frequency domain
    Ouput:
            X_k : DFT transformation of the sampled time signal
%}
function X_k = dftFuntion(x_n,N)
L = length(x_n);    %Compute the number of samples in time domain
% Checking condition for occurance of aliasing
if(N < L)
    fprintf("Error: Aliasing problem exists");
end
%% Padding with zeros in case of N > L
xn = [x_n, zeros(1,N - L)];

%% Compute the DFT
% Calculate the exponential term
E = zeros(N,N);
for k = 0: N-1
    for n = 0: N-1
        exponenital = exp((-1j*2*pi*k*n)/N);
        %Store the exponential term to multiply it by the samples, i.e. x[n]
        E(k+1,n+1) = exponenital;
    end
end
% Calculate the DFT 
X_k = xn * E;
end