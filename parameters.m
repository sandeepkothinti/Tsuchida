Fs=22050;
gammatone_opts_2ms=struct('Fs',22050, 'n_gmfb', 64, 'gmfb_lf', 200, 'gmfb_hf', 11025, 'width', 2e-3, 'shift',1e-3); 
gammatone_opts_5ms=struct('Fs',22050, 'n_gmfb', 64, 'gmfb_lf', 200, 'gmfb_hf', 11025, 'width', 5e-3, 'shift',2e-3); 
gammatone_opts_10ms=struct('Fs',22050, 'n_gmfb', 64, 'gmfb_lf', 200, 'gmfb_hf', 11025, 'width', 10e-3, 'shift',5e-3); 
gammatone_opts_20ms=struct('Fs',22050, 'n_gmfb', 64, 'gmfb_lf', 200, 'gmfb_hf', 11025, 'width', 20e-3, 'shift',10e-3); 
gammatone_opts_30ms=struct('Fs',22050, 'n_gmfb', 64, 'gmfb_lf', 200, 'gmfb_hf', 11025, 'width', 30e-3, 'shift',10e-3); 

Samples_frame=10e-3*Fs;
n_FFT=2^(ceil(log(Samples_frame)/log(2)));
mfcc_opts=struct('num_mel_bins', 40, 'num_ceps', 13, 'cep_lifter', 22, ...
                 'high_freq', 11025, 'low_freq', 20, 'fs', 22050,...
                 'nFFT', n_FFT, 'width', 25e-3, 'shift', 10e-3);
pca_opts=struct('num_bands', 20, 'num_filters', 7, 'slide', 3, 'splice',4, 'pca_bases', 3);