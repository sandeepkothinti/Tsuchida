 parameters
 gmf_2ms=aud2gmf('file_list',20, gammatone_opts_2ms); 
 load('Data/tsuchida_gmf_new.mat', 'gmf_pca_bases_2ms', 'mean_vec_2ms');
 gmf_feats_2ms=gmf_apply_pca(gmf_2ms,gmf_pca_bases_2ms,mean_vec_2ms, pca_opts);
 save('Data/test_gmf_new.mat', 'gmf_feats_2ms', '-append')