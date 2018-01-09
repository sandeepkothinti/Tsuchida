function gmm_sal_local=compute_local_llk(features, delay)
gmm_sal_local=cell(20,1);
for x=1:20
    feats=features{x,1};
    % Local Saliency
    gmm_sal_local_temp=-400*ones(length(feats),1);
    for k=200:length(feats)
        len=max(1, k-delay);
        gmm_mean=mean(feats(len:k-1,:));
        gmm_cov=cov(feats(len:k-1,:))+1e-9*eye(length(gmm_mean));
        gmm_sal_local_temp(k,1)=-log(mvnpdf(feats(k,:),gmm_mean, gmm_cov));
    end
    gmm_sal_local{x,1}=gmm_sal_local_temp;
end
end