mkdir Models
load('Data/tsuchida_gmf_new.mat', 'gmf_mat_2ms')
gmf_mat=gmf_mat_2ms;
gmf_mat_2ms=[];
data_size=length(gmf_mat);
options = statset('Display','iter');
gmm_gmf_5_shared=fitgmdist(gmf_mat(1:data_size,:),5,'CovarianceType','diagonal','SharedCovariance',false,'Options', options);
save('Models/tsuchida_models_2ms.mat', 'gmm_gmf_5_shared');
gmm_gmf_10_shared=fitgmdist(gmf_mat(1:data_size,:),10,'CovarianceType','diagonal','SharedCovariance',false,'Options', options);
save('Models/tsuchida_models_2ms.mat', 'gmm_gmf_10_shared', '-append');

load('Data/tsuchida_gmf_new.mat', 'gmf_mat_5ms')
gmf_mat=gmf_mat_5ms;
gmf_mat_5ms=[];
data_size=length(gmf_mat);
options = statset('Display','iter');
gmm_gmf_5_shared=fitgmdist(gmf_mat(1:data_size,:),5,'CovarianceType','diagonal','SharedCovariance',false,'Options', options);
save('Models/tsuchida_models_5ms.mat', 'gmm_gmf_5_shared');
gmm_gmf_10_shared=fitgmdist(gmf_mat(1:data_size,:),10,'CovarianceType','diagonal','SharedCovariance',false,'Options', options);
save('Models/tsuchida_models_5ms.mat', 'gmm_gmf_10_shared', '-append');