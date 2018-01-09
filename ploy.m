k=5;
time_length=length(gmm_sal_10_2ms{k,1});
dur=time_length/1000;
tscale=linspace(0,dur,time_length);
subplot(4,1,1)
event=B_Events{1,k};
stem(event(:,1), event(:,2))
xlim([0,dur])

subplot(4,1,2)
event=exp1_events{k,1};
stem(event(:,1), -event(:,2))
xlim([0,dur])
ylim([400,550])

subplot(4,1,3)
sal=movmean(movmean(gmm_sal_10_2ms{k,1},500),500);
plot(tscale(1000:end-1000), sal(1000:end-1000))
xlim([0,dur])

subplot(4,1,4)
time_length=length(sal_analysis{k,1});
dur=time_length/125;
tscale=linspace(0,dur,time_length);
plot(tscale, sal_analysis{k,1})
xlim([0,dur])