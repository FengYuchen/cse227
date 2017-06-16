function [list, tmp] = mfcclist(oldlist, sr,numcep,nbands,wintime,hoptime)
    
    [mm,~] = melfcc(oldlist, sr, 'maxfreq', 8000, 'numcep', numcep, 'nbands', nbands, 'fbtype', 'fcmel', 'dcttype', 1, 'usecmp', 1, 'wintime', wintime, 'hoptime', hoptime, 'preemph', 0, 'dither', 1);
    [list,tmp] = invmelfcc(mm, sr, 'maxfreq', 8000, 'numcep', numcep, 'nbands', nbands, 'fbtype', 'fcmel', 'dcttype', 1, 'usecmp', 1, 'wintime', wintime, 'hoptime', hoptime, 'preemph', 0, 'dither', 1);
   % l = size(oldlist);
   % tmplist = oldlist(3921:7840);
   % [tmpmm,~] = melfcc(tmplist, sr, 'maxfreq', 8000, 'numcep', numcep, 'nbands', nbands, 'fbtype', 'fcmel', 'dcttype', 1, 'usecmp', 1, 'wintime', wintime, 'hoptime', hoptime, 'preemph', 0, 'dither', 1);
   % n = size(tmpmm,2);
   % sum = 0;
   % for i = 1:numcep
   %     for j = 1:8
  %          sum = sum + abs(mm(i,j+10) - tmpmm(i,j));
  %      end
  %  end
  %  disp(mm(:,11:18));
  %  disp(tmpmm(:,1:8));
  %  disp (sum);
   % disp(size(oldlist))
end