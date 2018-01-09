function fft_cells=audio2fft(file_list, N_files, mfcc_opts)
%%% This function computes STFT for a set of audio files. Make sure that
%%% you provide full path and appropriate mfcc_opts. You can choose number
%%% of files you want to process by using N_files
Width=mfcc_opts.width;
Shift=mfcc_opts.shift;
Fs=mfcc_opts.fs;
n_FFT=mfcc_opts.nFFT;
fid=fopen(file_list);
Samples_frame=floor(Width*Fs);
Samples_shift=floor(Shift*Fs);
fft_cells=cell(N_files,1);
for k=1:N_files
    if mod(k,10)==0
        fprintf('Completed MFCC for %d files \n', k);
    end
    filename=char(fgetl(fid));
    [audio_samples,fs]=audioread(filename);
    audio_samples=resample(audio_samples(:,1),1,fs/mfcc_opts.Fs);
    audio_samples(2:end)=audio_samples(2:end)-0.97*audio_samples(1:end-1);
    audio_samples=audio_samples-mean(audio_samples);
    n_frames=floor((length(audio_samples)-Samples_frame)/Samples_shift)+1;
    windowed_samples=zeros(Samples_frame, n_frames);
    for i=1:n_frames
        windowed_samples(:, i)=audio_samples(((i-1)*Samples_shift+1):((i-1)*Samples_shift+Samples_frame)).*hamming(Samples_frame);
    end
    fft_temp=fft(windowed_samples, n_FFT, 1);
    fft_cells{k,1}=abs(fft_temp(1:n_FFT/2+1,:));
end
end