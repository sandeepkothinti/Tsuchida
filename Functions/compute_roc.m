function [ROC, thresholds]=compute_roc(ref, comp, min_th, max_th, th_values, look_ahead, aud_list, mov_av)
% Make sure ref and comp have same lengths
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
        total_hits=total_hits+sum(ref_x==1);
        total_nonhits=total_nonhits+length(ref_x);
        comp_dec=movmean(movmean(comp{x,1},mov_av),mov_av/2)>threshold;
        for k=1:length(ref_x)
            if ref_x(k)==0 && sum(comp_dec(k:min(k+look_ahead, end))==1)>1
                false=false+1;
            elseif ref_x(k)==1 && sum(comp_dec(k:min(k+look_ahead, end))==1)>1
                hits=hits+1;
            end
        end
    end
    total_nonhits=total_nonhits-total_hits;
    ROC(th,1)=hits/total_hits;
    ROC(th,2)=false/total_nonhits;
end
end
        
            
            
        

