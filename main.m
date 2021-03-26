cd 'G:\Matlab\Programy\PIW'

% Przyklad z prezentacji
% img = zeros(7, 7);
% img([9, 10, 11, 15, 19, 20, 22, 27, 29, 34, 37, 38, 39, 40, 41]) = 1;

% Moj przyklad
% img = zeros(6, 7);
% img([4, 5, 6, 9, 12, 14, 18, 19, 24, 25, 30, 31, 32, 33, 35, 40]) = 1;

% Ten sam co wyzej tylko 7x7
% img = zeros(7, 7);
% img([4, 5, 6, 10, 13, 16, 20, 22, 27, 29, 34, 36, 37, 38, 40, 46]) = 1;

% Pelny
% img = zeros(7, 7);
% img([9, 10, 11, 15, 16, 17, 18, 19, 20, 22, 23, 24, 25, 26, 27, 29, 30, 31, 32, 33, 34, 37, 38, 39, 40, 41]) = 1;

% name = 'Irregular';
% img = logical(imread(strcat(name, '.png')));

% img = circle(512, 512, 32.5);

% img = [0, 1, 1, 1, 0];

obw_v = [];

obw1_v = [];
obw2_v = [];
obw3_v = [];
obw4_v = [];

time1_v = [];
time2_v = [];
time3_v = [];
time4_v = [];

diff1_v = [];
diff2_v = [];
diff3_v = [];
diff4_v = [];

for i=10:10:200
img = circle(512, 510, i);
% img = square(512, 512, i);

props = regionprops(img, 'Perimeter');
obw = props.Perimeter;

tic
obw1 = sum(sum(kontur(padarray(img, [1 1], 0))));
time1 = toc;

tic
obw2 = metoda2(img);
time2 = toc;

tic
obw3 = metoda3(img);
time3 = toc;

tic
obw4 = metoda4(img);
time4 = toc;

obw = 2*pi*i;
% obw = 4*i;
obw_v = [obw_v obw];

diff1 = abs(obw - obw1);
diff2 = abs(obw - obw2);
diff3 = abs(obw - obw3);
diff4 = abs(obw - obw4);

obw1_v = [obw1_v obw1];
obw2_v = [obw2_v obw2];
obw3_v = [obw3_v obw3];
obw4_v = [obw4_v obw4];

time1_v = [time1_v time1];
time2_v = [time2_v time2];
time3_v = [time3_v time3];
time4_v = [time4_v time4];

diff1_v = [diff1_v diff1];
diff2_v = [diff2_v diff2];
diff3_v = [diff3_v diff3];
diff4_v = [diff4_v diff4];
end

%%
% Obwody
plot(10:10:200, obw1_v)
hold on
plot(10:10:200, obw2_v)
hold on
plot(10:10:200, obw3_v)
hold on
plot(10:10:200, obw4_v)
hold on
grid on
legend('Metoda 1', 'Metoda 2', 'Metoda 3', 'Metoda 4')
% xlabel('Promien')
xlabel('Dlugosc boku')
ylabel('Obwod')
% saveas(gcf, 'G:\Matlab\Programy\PIW\Circles\Perims2.png')
saveas(gcf, 'G:\Matlab\Programy\PIW\Squares\Perims2.png')

%%
% Roznice
plot(10:10:200, diff1_v)
hold on
plot(10:10:200, diff2_v)
hold on
plot(10:10:200, diff3_v)
hold on
plot(10:10:200, diff4_v)
hold on
grid on
legend('Metoda 1', 'Metoda 2', 'Metoda 3', 'Metoda 4')
% xlabel('Promien')
xlabel('Dlugosc boku')
ylabel('Roznica')
% saveas(gcf, 'G:\Matlab\Programy\PIW\Circles\Diffs2.png')
saveas(gcf, 'G:\Matlab\Programy\PIW\Squares\Diffs2.png')

%%
% Czasy
plot(10:10:200, time1_v)
hold on
plot(10:10:200, time2_v)
hold on
plot(10:10:200, time3_v)
hold on
plot(10:10:200, time4_v)
hold on
grid on
legend('Metoda 1', 'Metoda 2', 'Metoda 3', 'Metoda 4')
xlabel('Promien')
% xlabel('Dlugosc boku')
ylabel('Czas[s]')
saveas(gcf, 'G:\Matlab\Programy\PIW\Circles\Times2_2.png')
% saveas(gcf, 'G:\Matlab\Programy\PIW\Squares\Times2_s.png')

%%
% Roznice relative
plot(10:10:200, diff1_v./obw_v)
hold on
plot(10:10:200, diff2_v./obw_v)
hold on
plot(10:10:200, diff3_v./obw_v)
hold on
plot(10:10:200, diff4_v./obw_v)
hold on
grid on
legend('Metoda 1', 'Metoda 2', 'Metoda 3', 'Metoda 4')
% xlabel('Promien')
xlabel('Dlugosc boku')
ylabel('Roznica wzgledna')
% saveas(gcf, 'G:\Matlab\Programy\PIW\Circles\Relative2.png')
saveas(gcf, 'G:\Matlab\Programy\PIW\Squares\Relative2.png')