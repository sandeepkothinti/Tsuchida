load('Results\sal_global.mat', 'gmm_sal_5_2ms', 'gmm_sal_10_2ms', 'gmm_sal_5_5ms','gmm_sal_10_5ms');
for x=1:20
gmm_sal_5_5ms{x,1}=resample(gmm_sal_5_5ms{x,1},125, 500);
gmm_sal_5_2ms{x,1}=resample(gmm_sal_5_2ms{x,1},125, 1000);
gmm_sal_10_5ms{x,1}=resample(gmm_sal_10_5ms{x,1},125, 500);
gmm_sal_10_2ms{x,1}=resample(gmm_sal_10_2ms{x,1},125, 1000);
end
save('Results\sal_global_resampled.mat', 'gmm_sal_5_2ms', 'gmm_sal_10_2ms', 'gmm_sal_5_5ms','gmm_sal_10_5ms')