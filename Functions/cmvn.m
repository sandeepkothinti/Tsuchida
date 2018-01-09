function [outp]=cmvn(inp)
%%% This function applies for each file 
n_files=length(inp);
outp=cell(n_files,1);
for k=1:n_files
    mean_k=mean(inp{k,1},2);
    std_k=std(inp{k,1}');
    outp{k,1}=(inp{k,1}-mean_k)./std_k';
end
