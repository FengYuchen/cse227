
sr = 1:4;
[tmp,sr(1)] = audioread('call911_fast.mp3');
d1 = tmp(:,1);
figure;
plot(d1);
%[d2,sr(2)] = audioread('airplane1.mp3');
%[d3,sr(3)] = audioread('mode.mp3');
d1 = d1(1:36480);
l = size(d1);
disp(l)
%[d4,sr(4)] = audioread('mode.mp3');
mi = 10000;
ma = -10000;
for i=1:l
    if mi > d1(i)
        mi = d1(i);
    end
    if ma < d1(i)
        ma = d1(i);
    end
end
numcep = 12;
nbands = 11;
wintime = 0.032;
hoptime = 0.016;

disp (mi)
disp (ma)
window = 384;
zu = l / window;
[duizhao,~] = melfcc(d1, sr(1), 'maxfreq', 8000, 'numcep', numcep, 'nbands', nbands, 'fbtype', 'fcmel', 'dcttype', 1, 'usecmp', 1, 'wintime', wintime, 'hoptime', hoptime, 'preemph', 0, 'dither', 1);
for i = 1:(window*2)
    g = rand(1,1);
    tt = rand(1,1)/2;
    if (g > 0.5)
        d1(i) = d1(i) * (1 + tt);
    else 
        d1(i) = d1(i) * (1 - tt);
    end
end
st = window * 2;
for i = 2:(zu - 1)
    disp(i);
    st = window * i;
    for j = 1:window
      %  disp(j);
        if (d1(st+j)<0.001)
            continue;
        end
        orign = d1(st+j);
        index = -50;
        mi = 100000000.0;
        for k = -50:50
           
            xishu = k * 1.0 /100;
            d1(st+j) = orign * (1 + xishu);
            
            [mm,~] = melfcc(d1((st - window * 2 + 1):(st+window)), sr(1), 'maxfreq', 8000, 'numcep', numcep, 'nbands', nbands, 'fbtype', 'fcmel', 'dcttype', 1, 'usecmp', 1, 'wintime', wintime, 'hoptime', hoptime, 'preemph', 0, 'dither', 1);
            su = 0;
            for p = 1:numcep
                su = su + abs(mm(p,2) - duizhao(p,i)) * abs(mm(p,2) - duizhao(p,i));
            end
            
            if su < mi
                mi = su;
                index = xishu;
            end
        end
       % disp(mi)
       % disp(index)
        d1(st+j)=orign*(1+index);
    end
end
%d1 = resample(d1,sr,sr1);
%sr1 = sr;
%ll = size(d);

%d1 = d1(1:ll);

%soundsc(d1,sr1);
%for i=1:ll
   % d(i) = d(i) + d1(i)*0.4;
%end


%d = resample(d, 1, 2);
%d = resample(d, 2, 1);
%l = size(d)
%for i = 1:l
   % if (d(i) < 0.15)
 %       d(i) = d(i)/3;
 %   end
%end
%figure;
%plot(d);
        


%soundsc(d,sr)
[d1,~] = mfcclist(d1,sr(1),numcep,nbands,wintime,hoptime);
%[d2,~] = mfcclist(d2,sr(2),numcep,nbands,wintime,hoptime);
%[d3,~] = mfcclist(d3,sr(3),numcep,nbands,wintime,hoptime);
%[d4,~] = mfcclist(d4,sr(4),numcep,nbands,wintime,hoptime);

%soundsc(d,sr);
%soundsc(d1,sr1);
%soundsc(d2,sr2);
%soundsc(d3,sr3);
%soundsc(im,sr)
%l = size(im);
lim = 0.04;
d1 = cutheadandtail(d1,lim);
soundsc(d1,sr(1));

%d2 = cutheadandtail(d2,lim);
%d3 = cutheadandtail(d3,lim);
%d4 = cutheadandtail(d4,lim);

%imm = 1:(l / 2);
%for i = 1:l
%    if mod(i,2)==0
%        imm(i / 2) = im(i);
%    end
%end
%soundsc(imm,sr)
%figure;
%plot(im);
%l = size(im)
%soundsc(im,sr)
%im = [d1;d2;d3];
im = d1;
plot(im);

wavwrite(im,sr(1),'confused_call_normal.wav')
