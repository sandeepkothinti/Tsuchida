function gmf_feats=gmf_apply_pca(gmf_cells, gmf_pca, mean_vec, pca_opts)
gmf_feats=cell(size(gmf_cells));
for k=1:size(gmf_cells,1)
    gmf_in=gmf_cells{k,1}';
    for band=1:pca_opts.num_bands
        filter_ind=(band-1)*pca_opts.slide+1:(band-1)*pca_opts.slide+pca_opts.num_filters;
        if pca_opts.splice>0
            gmf_temp=mat_splice(gmf_in(filter_ind,:), pca_opts.splice)-mean_vec(band,:)';
        else
            gmf_temp= gmf_in(filter_ind,:)-mean_vec(band,:);
        end
        gmf_feats{k,1}=[gmf_feats{k,1},gmf_temp'*gmf_pca{band,1}];
    end
end