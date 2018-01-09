parameters;
[gmf_feats_2ms, gmf_pca_bases_2ms, gmf_cells_2ms,mean_vec_2ms]=compute_gmf('temp', 100, gammatone_opts_2ms, pca_opts);
 gmf_mat_2ms=[];
 for k=1:size(gmf_feats_2ms,1)
     gmf_mat_2ms=[gmf_mat_2ms;gmf_feats_2ms{k,1}];
 end
save('Data/tsuchida_gmf_new.mat', 'gmf_mat_2ms', 'gmf_pca_bases_2ms','mean_vec_2ms', '-v7.3');
clear gmf_mat_2ms;
[gmf_feats_5ms, gmf_pca_bases_5ms, gmf_cells_5ms,mean_vec_5ms]=compute_gmf('temp', 100, gammatone_opts_5ms, pca_opts);
 gmf_mat_5ms=[];
 for k=1:size(gmf_feats_5ms,1)
     gmf_mat_5ms=[gmf_mat_5ms;gmf_feats_5ms{k,1}];
 end
save('Data/tsuchida_gmf_new.mat', 'gmf_mat_5ms', 'gmf_pca_bases_5ms','mean_vec_5ms', '-append');
clear gmf_mat_5ms;