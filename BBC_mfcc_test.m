parameters
load('sal_db_mfcc.mat', 'sal_db_mfcc')
sal_db_proj=cell(20,1);
load('BBC_mfcc.mat', 'mfcc_pca');
load('BBC_models.mat');
mfcc_sal=cell(20,1);
sal_db_mfcc=splice(sal_db_mfcc,4);
for x=1:20
  sal_db_proj{x,1}=sal_db_mfcc{x,1}'*mfcc_pca(:,1:40);
  mfcc_sal{x,1}=log(pdf(gmm_model_100,sal_db_proj{x,1}));
end