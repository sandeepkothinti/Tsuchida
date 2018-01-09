function [gmf_pca_bases, mean_vec]=gmf_compute_pca(gmf_cells, pca_opts)
fprintf('PCA computation from gmf features \n');
gmf_pca_bases=cell(pca_opts.num_bands,1);
mean_vec=zeros(pca_opts.num_bands, pca_opts.num_filters*(2*pca_opts.splice+1));
for band=1:pca_opts.num_bands
    gmf_banks=[];
    fprintf('PCA analysis for band %d \n', band)
    for k=1:size(gmf_cells,1)
        gmf_in=gmf_cells{k,1}';
        filter_ind=(band-1)*pca_opts.slide+1:(band-1)*pca_opts.slide+pca_opts.num_filters;
        gmf_temp=mat_splice(gmf_in(filter_ind,:), pca_opts.splice);
        gmf_banks=[gmf_banks,gmf_temp];     
    end
    mean_vec(band,:)=mean(gmf_banks, 2);
    gmf_banks=gmf_banks-mean_vec(band,:)';
    bases=my_pca(gmf_banks');
    gmf_pca_bases{band,1}=bases(:,1:pca_opts.pca_bases);
end
end
