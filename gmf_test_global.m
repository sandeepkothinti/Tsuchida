load('Data/test_gmf_new.mat', 'gmf_feats_2ms');
load('Models/tsuchida_models_2ms.mat', 'gmm_gmf_5_shared')
%load('Models/tsuchida_models_2ms.mat', 'gmm_gmf_10_shared')
%gmm_sal_10_2ms=compute_global_llk(gmf_feats_2ms,gmm_gmf_10_shared);
gmm_sal_5_2ms=compute_global_llk(gmf_feats_2ms,gmm_gmf_5_shared);
save('Results/sal_global.mat','gmm_sal_5_2ms')