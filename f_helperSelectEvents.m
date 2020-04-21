function [theEpochs]=f_helperSelectEvents(EEG, markerArray, varargin)
theEpochs=[];

if numel(EEG.epoch) == 0
    disp('Function requires epoched data!')
return
end

if numel(varargin)==1   %boolean     MODE
%     markerArray=unique(cat(2, markerArray, varargin{1}))    

    for jot=1:numel(EEG.epoch)           
        tempo1=ismember(EEG.epoch(jot).eventtype,markerArray); %two must match       
        tempo2=ismember(EEG.epoch(jot).eventtype,varargin{1}); %two must match        
        
       if (sum(tempo1) == 1) & (sum(tempo2) == 1)
            theEpochs=[theEpochs; jot];
       end      
    end
    
else 
    for jot=1:numel(EEG.epoch)    
       tempo=ismember(EEG.epoch(jot).eventtype,markerArray); %two must match
       if sum(tempo) == 1
            theEpochs=[theEpochs; jot];
       end      
    end    
end
    

