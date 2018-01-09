function melbanks=get_melbanks
global mfcc_opts; 
n_FFT=mfcc_opts.nFFT;
Fs=mfcc_opts.fs;
num_bins=mfcc_opts.num_mel_bins;
melbanks=zeros(num_bins,n_FFT/2+1);
fft_bin_width=Fs/n_FFT;
mel_high_freq=melscale(mfcc_opts.high_freq);
mel_low_freq=melscale(mfcc_opts.low_freq);
mel_freq_delta=(mel_high_freq-mel_low_freq)/(num_bins+1);
for k=1:num_bins
left_mel=mel_low_freq+(k-1)*mel_freq_delta;
center_mel=mel_low_freq+k*mel_freq_delta;
right_mel=mel_low_freq+(k+1)*mel_freq_delta;
for j=1:n_FFT/2+1
mel_freq=melscale(fft_bin_width*j);
if mel_freq>left_mel && mel_freq < center_mel
    melbanks(k,j)=(mel_freq-left_mel)/(center_mel-left_mel);
elseif mel_freq<right_mel && mel_freq > center_mel
    melbanks(k,j)=(right_mel-mel_freq)/(right_mel-center_mel);
end
end
end
end
function lin_freq=inversemel(mel_freq)
lin_freq=700*(exp(mel_freq/1127)-1);
end
function mel_freq=melscale(lin_freq)
mel_freq=1127*log(1+lin_freq/700);
end