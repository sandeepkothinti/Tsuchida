close all
load('saliency_results.mat');
figure
subplot(3,1,1)
record=record_sal{1,1};
plot(mode(record)>0);
ylim([-0.1,1.1])
subplot(3,1,2)
plot(resample(-movmean(mfcc_sal{1,1},30),10,8)>-180);
ylim([-0.1,1.1])
subplot(3,1,3)
plot(resample(-movmean(gmf_sal{1,1},30),10,8)>-295);
ylim([-0.1,1.1])