function UI

global numtZone tZone Xod Yod;
numtZone = 6;

box on;
square on;
axis([0 30 0 30]);
axis square;
xlabel('X-axis');
ylabel('Y-axis');
hold on;

tZone = struct([]);

%coordinates are in the order of increasing x-values
%the same order is followed for values of y(and not increasing y values else it wont be for the same vertex)
%side are numbered as: v1v2, v2v3, v3v1

%Also threat zone numbering gives a higher number to a nested zone, this is
%for matlab reasons and o/w a nested zone(fill function would not be visible)

tZone(1).Xt = [4,6,12];
tZone(1).Yt = [10,2,8];
tZone(1).tp = 1.3;

tZone(2).Xt = [6,7,9];
tZone(2).Yt = [8,5,7];
tZone(2).tp = 1.6;

tZone(3).Xt = [8,12,23];
tZone(3).Yt = [11,21,9];
tZone(3).tp = 1.3;

tZone(4).Xt = [10,13,20];
tZone(4).Yt = [12,18,11];
tZone(4).tp = 1.6;

tZone(5).Xt = [17,23,28];
tZone(5).Yt = [23,15,25];
tZone(5).tp = 1.3;

tZone(6).Xt = [19,23,26];
tZone(6).Yt = [22,17,23];
tZone(6).tp = 1.8;

for index = 1:numtZone
    fill(tZone(index).Xt,tZone(index).Yt,'w');
end

Xod = [2,24];
Yod = [3,22];
plot(Xod,Yod,'*b');
text(Xod(1)-1,Yod(1)-1,'origin');
text(Xod(2)+2,Yod(2),'target');

dy = (Yod(2)-Yod(1));
dx = (Xod(2)-Xod(1));
m = dy/dx;
X = (Xod(1):3:Xod(end));
yc = (m*Xod(1)-Yod(1));
Y = m*X - yc;
plot(X,Y,'.-.b');