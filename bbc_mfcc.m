parameters
inp=audio2fft('~/Desktop/temp',198);
inp=fft2mfcc(inp);
mfcc_mvn=cmvn(inp);
