[a,b] = audioread('confused_location.wav');
[c,d] = audioread('location.mp3');
g = size(c);
g = g(1);
kk = 9000;
p = zeros(g + 30000,1);
p(1:14000) = c(1:14000);
%p(29001:29001+kk) = c(14001:14001+kk)*1.5;
%p(44001+kk+1:(g+30000)) = c(14001+kk+1:g);
p(29001:g+15000) = c(14001:g)*3;
c = p;
[x,y] = audioread('noise1.mp3');
x = x(:,1);
%figure;
%plot(x);
[x1,y1] = audioread('noise2.mp3');

x1 = resample(x1,d,y1);
x1 = x1(:,1);
[x2,y2] = audioread('noise3.mp3');
x2 = x2(:,1);
figure;
plot(c);
x2 = resample(x2,d,y2);

x = resample(x,d,y);
y = d;
g = size(c);
g = g(1);
for i = 1:g
    c(i) = c(i) + x(i)*0.2 + x1(i)*0.3 + x2(i)*0.2;
end
figure;
plot(c);
%soundsc(c,d)
%soundsc(a,b);
%a = resample(a,24000,b);
%b = 24000;
%[c,d] = audioread('location.mp3');
numcep = 13;
nbands = 40;
wintime = 0.032;
hoptime = 0.016;
[c,~] = mfcclist(c,d,numcep,nbands,wintime,hoptime);
soundsc(c,d)

%a = a(1:2*g);
%figure;
%plot(c(1:600))
%c = resample(c, d / 2,d);
%sound(c(3000:4500),d/2);

%sound(a,d)
