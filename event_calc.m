exp1_events=cell(20,1);
exp2_events=cell(20,1);
exp3_events=cell(20,1);
for k=1:20
smoothed_global_llk=movmean(movmean(gmm_sal_10_2ms{k,1},1000),1000);
smoothed_cent_global_llk=smoothed_global_llk-mean(gmm_sal_10_2ms{k,1});
smoothed_movcent_global_llk=smoothed_global_llk-movmean(gmm_sal_10_2ms{k,1},10000);
[strength,locs]=findpeaks(smoothed_global_llk,1000);
exp1_events{k,1}=[locs,strength];
[strength,locs]=findpeaks(smoothed_cent_global_llk,1000);
exp2_events{k,1}=[locs,strength];
[strength,locs]=findpeaks(smoothed_movcent_global_llk,1000);
exp3_events{k,1}=[locs,strength];
end
save('Results\events.mat', 'exp1_events', 'exp2_events', 'exp3_events');