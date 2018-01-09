parameters
load('BBC_mfcc.mat');
options = statset('Display','iter');
gmm_model_100=fitgmdist(mfcc_proj,100,'CovarianceType','diagonal','SharedCovariance',true,'Options', options);
save('BBC_models.mat', 'gmm_model_100');
gmm_model_200=fitgmdist(mfcc_proj,200,'CovarianceType','diagonal','SharedCovariance',true,'Options', options);
save('BBC_models.mat', 'gmm_model_200', '-append');
