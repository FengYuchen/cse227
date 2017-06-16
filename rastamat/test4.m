[a,b] = audioread('airplane.mp3');
[v,sr] = audioread('back1.mp3');
%a = a(:,1);
v = v(:,1);
v = resample(v,b,sr);
sr = b;
numcep = 20;
nbands = 20;
wintime = 0.064;
hoptime = 0.016;
l = size(v);
l = l(1);
la = size(a);
la = la(1);
disp(l/3)
st = fix(l /2);
disp ((st))
for loc = st: (st+ la - 1)
    a(loc-st+1)= a(loc-st+1)+v(loc)*0.3;
end
c = a;

[c,~] = mfcclist(c,b,numcep,nbands,wintime,hoptime);
%soundsc(c,b);
for loc = st:(st + la-1)
    v(loc) = c(loc-st+1);
end
soundsc(v,b);
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
%soundsc(c,d);

wavwrite(v,sr,'transformer3.wav');