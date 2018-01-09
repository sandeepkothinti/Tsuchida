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
for k=1
    width=window(k);
        sal=struct2array(load('Results\local_glob_resampled.mat', strcat('gmm_sal_', num2str(width), 'ms')));
        %roc1=compute_roc(sal_analysis, sal,-150, -450, 40, 10, 1:20);
        roc2=compute_roc(sal_analysis, sal,-150, -450, 40, 10, sparse);
        %   roc3=compute_roc(sal_analysis, sal,-150, -450, 40, 10, 1:20);
        plot(roc2(:,2), roc2(:,1), color(k))
        ind=max(find(roc3(:,2)<pf));
        best_pd=[best_pd;roc3(ind,1)];
end

