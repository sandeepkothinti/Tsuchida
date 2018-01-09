%  parameters
%  gmf=aud2gmf('/Users/PrashanthBollam/Desktop/Lab/Sal_DB/file_list',20, gammatone_opts);
%  load('Data/tsuchida_gmf.mat', 'gmf_pca_bases');
%  gmf_feats=gmf_apply_pca(gmf,gmf_pca_bases);
% % save('sal_db_gmf_small.mat', 'gmf');
% % save('sal_db_gmf_small.mat', 'gmf_feats', '-append');
%  load('Data/saliency_results.mat', 'record_sal')
% % load('sal_db_gmf_small.mat', 'gmf_feats')
%  load('Models/tsuchida_models.mat', 'gmm_gmf_20_full');
% gmm_sal=cell(20,1);
% gmm_sal_total=cell(20,1);
% sal_analysis=cell(20,1);
% for x=1:20
%     x
%     feats=gmf_feats{x,1};
%     % Global Saliency
%     log_llk=-log(pdf(gmm_gmf_20_full,feats));
%     gmm_sal_raw=movmean(log_llk,200);
%     %max_gmm_sal=max(gmm_sal_raw);
%     %min_gmm_sal=min(gmm_sal_raw);
%     %gmm_sal{x,1}=(gmm_sal_raw-min_gmm_sal)/(max_gmm_sal-min_gmm_sal);
%     gmm_sal{x,1}=gmm_sal_raw;
%     % Local Saliency
%     gmm_sal_local_temp=-400*ones(length(log_llk),1);
%     for k=200:length(gmm_sal{x,1})
%         len=max(1, k-4000);
%         gmm_mean=mean(feats(len:k-1,:));
%         gmm_cov=cov(feats(len:k-1,:));
%         gmm_sal_local_temp(k,1)=-log(mvnpdf(feats(k,:),gmm_mean, gmm_cov));
%     end
%     gmm_sal_local_temp=movmean(gmm_sal_local_temp,200);
%     %min_gmm_sal_local=min(gmm_sal_local_temp(300:end));
%     %max_gmm_sal_local=max(gmm_sal_local_temp(300:end));
%     %gmm_sal_local_temp(300:end)=(gmm_sal_local_temp(300:end)-min_gmm_sal_local)/(max_gmm_sal_local-min_gmm_sal_local);
%     %gmm_sal_local_temp(1:299)=0;
%     gmm_sal_total{x,1}=gmm_sal_local_temp;
%     behav_sal=record_sal{1,x};
%     behav_sal(isnan(behav_sal))=0;
%     behav_sal=mode(behav_sal);
%     behav_sal=movmean(behav_sal,50);
%     %now_sal=now_sal(2:end)-now_sal(1:end-1);
%     sal_analysis{x,1}=resample(behav_sal, length(feats), length(behav_sal));
% end
for k=1
    subplot(2,1,1)
    plot(sal_analysis{k,1})
    title('Bahavioral Saliency', 'FontSize', 4)
    subplot(2,1,2)
    plot(gmm_sal_20ms_2s{k,1})
    title('Saliency for 5ms window with 1s lookback', 'FontSize', 4)
%     subplot(5,1,3)
%     plot(gmm_sal_10ms_1s{k,1})
%     title('Saliency for 10ms window with 1s lookback', 'FontSize', 4)
%     subplot(5,1,4)
%     plot(gmm_sal_20ms_1s{k,1})
%     title('Saliency for 20ms window with 1s lookback', 'FontSize', 4)
%     subplot(5,1,5)
%     plot(gmm_sal_30ms_1s{k,1})
%     title('Saliency for 30ms window with 1s lookback', 'FontSize', 4)
%     print(strcat('Results\local_sal\sal_map_', num2str(k), '.png'), '-dpng')
%     %close
end
