function tf = Gabor( x, tau, t, f, sgm )
% GABOR calculate the scaled gabor transform on unbalanced
% data x.
  
  % parameters
  dtau = tau(2) - tau(1);
  df = f(2) - f(1);
  base_f = f(1);
  Q = ceil(2 / sqrt(sgm) / dtau); % exp(-pi*a^2) < 1e-5 <=> abs(a) > 1.9143 
  T = length(t);
  F = length(f);
  N = round(1 / (df * dtau));
  
  % calculated parameters
  padx = [zeros(1, Q), x', zeros(1, Q)];
  n = round(t / dtau);
  tf = zeros(T, F);
  xN = zeros(1, N);
  
  % repeated parameters
  phased_window = exp(-2j*pi*(-Q:Q)*dtau*base_f) .* exp(-sgm * pi * ((-Q : Q) * dtau) .^ 2);
  scale = sgm^0.25 * dtau * exp(-2j*pi*(f*Q*dtau+base_f*Q*dtau));
  
  % fft
  for idx = 1: T
    t0 = t(idx);
    n0 = n(idx);
    xN(1: 2*Q+1) = padx(n0 + 1: n0 + 2*Q + 1) .* phased_window;
    fftx = fft(xN);
    tf(idx, :) = scale .* fftx(1, 1:F) .* exp(-2j*pi*f*t0);
  end
end

