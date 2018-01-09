function spliced_out=splice(inp, splice_dim)
num_files=length(inp);
spliced_out=cell(num_files,1);
for k=1:num_files
    feat=inp{k,1};
    feat_begin=repmat(feat(:,1), 1,splice_dim);
    feat_end=repmat(feat(:,end), 1, splice_dim);
    feat=[feat_begin,feat,feat_end];
    out_feat=[];
    for j=-splice_dim:splice_dim
        out_feat=[out_feat;feat(:,splice_dim+j+1:end-splice_dim+j)];
    end
    spliced_out{k,1}=out_feat;
end
end