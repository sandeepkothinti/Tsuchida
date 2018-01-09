function gammatone_out=aud2gmf(file_list, N_files, gammatone_opts)
%%% This function computes gammatone filter response for wave files
%%% file_list - This should have path to wavefiles, make sure they are
%%% absolute paths
%%% N_files - You can specify how many number of files you want to have
%%% gammatone responses for
%%% gammatone_out - This is a feature cell. 
center_freqs=iosr.auditory.makeErbCFs(gammatone_opts.gmfb_lf,gammatone_opts.gmfb_hf,gammatone_opts.n_gmfb);
gammatone_out=cell(N_files,1);
fid=fopen(file_list);
for k=1:N_files 
    if mod(k-1,5)==0
        fprintf('Completed GMF for %d files \n', k-1);
    end
    filename=char(fgetl(fid));
    [audio_samples, fs]=audioread(filename);
    audio_samples=resample(audio_samples(:,1),1,fs/gammatone_opts.Fs);
    length_file=length(audio_samples);
    i=1;
    while length_file>2e6
         audio_samples_i=audio_samples((i-1)*2e6+1:i*2e6);
         gammatone_response=iosr.auditory.gammatoneFast(audio_samples_i, center_freqs, gammatone_opts.Fs);
         gammatone_out{k,1}=[gammatone_out{k,1};compute_frames(gammatone_response,gammatone_opts.width,gammatone_opts.shift, gammatone_opts.Fs)];
         i=i+1;
         length_file=length_file-2e6;     
    end
    audio_samples_i=audio_samples((i-1)*2e6+1:end);
    gammatone_response=iosr.auditory.gammatoneFast(audio_samples_i, center_freqs, gammatone_opts.Fs);     
    gammatone_out{k,1}=[gammatone_out{k,1};compute_frames(gammatone_response,gammatone_opts.width,gammatone_opts.shift, gammatone_opts.Fs)];
end
fprintf('GMF computation complete')
end