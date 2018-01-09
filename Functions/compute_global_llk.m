function gmm_sal_global=compute_global_llk(features, gmm_model)
gmm_sal_global=cell(20,1);
for x=1:20
    feats=features{x,1};
    gmm_sal_global_temp=-log(pdf(gmm_model,feats));
    gmm_sal_global{x,1}=gmm_sal_global_temp;
end
end