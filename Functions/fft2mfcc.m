function mfcc=fft2mfcc(fft_cells)
global mfcc_opts
mfcc=cell(size(fft_cells));
mel_banks=get_melbanks;
size(mel_banks)
for k=1:length(fft_cells) 
    k
    energy=log(sum(fft_cells{k,1}.*fft_cells{k,1}));
    MFB=mel_banks*fft_cells{k,1};
    LMFB=log(MFB+eps);
    MFC_full=dct(LMFB, [], 1);
    mfcc{k,1}=[energy;MFC_full(2:mfcc_opts.num_ceps, :)];
end
end