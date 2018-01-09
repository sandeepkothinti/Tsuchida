function frames_out=compute_frames(inp,width,shift, Fs)
%%% This function takes a signal and converts them to frames based on the
%%% input options. Width and Shift should be provided in seconds
%%% Returns computed frames in a matrix
Samples_frame=floor(width*Fs);
Samples_shift=floor(shift*Fs);
n_frames=floor((length(inp)-Samples_frame)/Samples_shift)+1
frames_out=zeros(n_frames, size(inp,2));
window=repmat(hamming(Samples_frame),[1,size(inp,2)]);
    for i=1:n_frames
        frames_out(i,:)=sum(inp(((i-1)*Samples_shift+1):((i-1)*Samples_shift+Samples_frame),:).*window,1);
    end
end