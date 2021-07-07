function [p f] = octfilt(x,fs)
%OCTFILT Filters input x and returns output y.

% MATLAB Code
% Generated by MATLAB(R) 8.4 and the DSP System Toolbox 8.7.
% Generated on: 09-Dec-2015 01:21:20

warning off
    
    B  = 1;       % Bands per octave
    N  = 10;      % Order
%     Fs = 24414;   % Sampling Frequency
    f = [63.0957 125.8925 251.1886 501.1872 ...
        1000 1258.9 1584.9 1995.2623 2511.9 3162.3...
         3981.0717 5011.9];
    p=zeros(1,length(f));
    T=length(x);
    for n = 1:length(f)
        if f(n)<1000
    h = fdesign.octave(B, 'Class 0', 'N,F0', N, f(n), fs);
    Hd = design(h, 'butter', ...
        'SOSScaleNorm', 'Linf');
    y = filter(Hd,x);
    p(1,n) = leq(y,T);
        elseif f(n)>=1000
                h = fdesign.octave(3, 'Class 0', 'N,F0', N, f(n), fs);
    Hd = design(h, 'butter', ...
        'SOSScaleNorm', 'Linf');
        end
    y = filter(Hd,x);
    p(1,n) = leq(y,T);
    end

