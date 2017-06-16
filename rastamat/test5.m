[a,b] = audioread('airplane.mp3');

%soundsc(a, b*1.2)

numcep = 12;
nbands = 12;
wintime = 0.016;
hoptime = 0.008;
b=b*1.2;
c = a;
[c,~] = mfcclist(c,b,numcep,nbands,wintime,hoptime);

%d=b;
%[x1,y1] = audioread('noise2.mp3');

%x1 = resample(x1,d,y1);
%x1 = x1(:,1);
%[x2,y2] = audioread('noise3.mp3');
%x2 = x2(:,1);

%x2 = resample(x2,d,y2);
%l= size(c);
%l = l(1);
for i = 1:l
%    c(i) = c(i) + x1(i)*0+x2(i)*0;
end
soundsc(c,b);

wavwrite(c,b*1.5,'confused_ai.wav');