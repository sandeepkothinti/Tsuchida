load('Data\test_gmf_new.mat', 'gmf_feats_2ms');
gmm_sal_2ms_1s=compute_local_llk(gmf_feats_2ms, 1000);
% for k=1:size(gmm_sal_2ms_1s,1)
%     k
%     gmm_sal_2ms_1s{k,1}=resample(gmm_sal_2ms_1s{k,1}, 125,1000);
% end
save('Results\local_sal_resampled.mat','gmm_sal_2ms_1s', '-append')