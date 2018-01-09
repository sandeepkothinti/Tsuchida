function [eigen_vec, cum_var]=my_pca(train)
covar=train'*train;
[~, eig, V]=svd(covar);
eig_val=diag(eig);
total_var=sum(eig_val);
cum_var=zeros(size(eig_val));
for i=1:size(eig_val)
    cum_var(i)=100*sum(eig_val(1:i))/total_var;
end
eigen_vec=V*diag(1./sqrt(eig_val));
end