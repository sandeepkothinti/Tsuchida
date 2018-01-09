function spliced_out=mat_splice(inp, splice_dim)
feat=inp;
feat_begin=repmat(feat(:,1), 1,splice_dim);
feat_end=repmat(feat(:,end), 1, splice_dim);
feat=[feat_begin,feat,feat_end];
spliced_out=[];
for j=-splice_dim:splice_dim
    spliced_out=[spliced_out;feat(:,splice_dim+j+1:end-splice_dim+j)];
end
end