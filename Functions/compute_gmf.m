function [gmf_feats, gmf_pca_bases, gmf_cells, mean_vec]=compute_gmf(file_list,N_files,gmf_opts, pca_opts)
%%% This function takes a file list and Number of samples and returns
%%% features that have PCA applied on them along with original GMF features
gmf_cells=aud2gmf(file_list, N_files, gmf_opts);
[gmf_pca_bases, mean_vec]=gmf_compute_pca(gmf_cells, pca_opts);
gmf_feats=gmf_apply_pca(gmf_cells,gmf_pca_bases, mean_vec, pca_opts);
end