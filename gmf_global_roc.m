parameters;
load('Results\behav_sal.mat');
window=[2,5];
sparse=[2,4,5,8,18,19];
dense=[1,3,6,7,9,10,11,12,13,14,15,16,17,20];
music=[7,11,13,17];
crowd=[2,3,6,9,10,14,16,19];
figure;
hold;
best_pd=[];
pf=0.3;
color=['r', 'b', 'g', 'c'];
for k=1:2
    width=window(k);
    sal=struct2array(load('Results\sal_global_resampled.mat', strcat('gmm_sal_5_', num2str(width), 'ms')));
        roc=compute_roc(sal_analysis, sal, -150, -450, 100, 200,1:20, 100);
        plot(roc(:,2), roc(:,1), color(k))
        ind=max(find(roc(:,2)<pf));
        best_pd=[best_pd;roc(ind,1)];
end

