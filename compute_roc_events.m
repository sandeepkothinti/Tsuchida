function [ROC, thresholds]=compute_roc_events(ref, comp,aud_list, th_values, aud_lengths, bin_size)
% Make sure ref and comp have same lengths
min_th=inf;
max_th=-inf;
for k=1:length(ref)
    events=comp{k,1};
    min_th=min(min_th, min(events(:,2)));
    max_th=max(max_th, max(events(:,2)));
end
thresholds=linspace(min_th, max_th, th_values);
ROC=zeros(th_values,2);
for th=1:th_values
    total_hits=0;
    total_nonhits=0;
    threshold=thresholds(th);
    hits=0;
    false=0;
    for x=aud_list
        ref_x=ref{x,1};
        comp_x=comp{x,1};
        comp_dec=comp_x(comp_x(:,2)>threshold, :);
        total_hits=total_hits+size(ref_x,1);
        total_nonhits=total_nonhits+aud_lengths(x,1)/bin_size;
        for k=1:size(ref_x,1)
            if sum(abs(ref_x(k,1) - comp_dec(:,1))<1)
                hits=hits+1;
            end
        end
        for k=1:size(comp_dec,1)
            if sum(abs(ref_x(:,1) - comp_dec(k,1))<1)<1
                false=false+1;
            end
        end
    end
    total_nonhits=total_nonhits-total_hits;
    ROC(th,1)=hits/total_hits;
    ROC(th,2)=false/total_nonhits;
end
%end
        
            
            
        

