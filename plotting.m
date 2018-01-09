load('Results\local_sal_resampled.mat', 'gmm_sal_20ms_2s')
load('Results\local_glob_resampled.mat', 'gmm_sal_5ms')
names=["Nature", "Sport", "Cafeteria", "Battle", "Airplane", "fair", "class_music", "bowling", "protests", "store", "drum", "blacksmith", "orchestra", "game", "dog", "casino", "piano", "chase", "maternity", "sailing"];
for x=1:20
    figure
    subplot(3,1,1);
    plot(sal_analysis{x,1});
    subplot(3,1,2);
    sal=gmm_sal_5ms{x,1};
    plot(sal(1:end-20)>-300);
    subplot(3,1,3);
    sal=gmm_sal_20ms_2s{x,1};
    plot(sal(1:end-20)>-350);
    print(strcat('Results\local_sal\sal_map_', names(x), '.png'), '-dpng')
    close
end
    