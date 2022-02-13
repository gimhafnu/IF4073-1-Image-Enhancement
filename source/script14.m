clear;
p = imread("../Image/mandril_gray.tif");
% q = imread("Kota.tif");
% x = imread("Strawberry.tif");
% y = imread("Larutan.tif");

% citraBerwarna(x)
figure;
myimhist(p);
% s = imhist(p);
% t = r.YData;
% v = transpose(t);
% u = cumSumFunc(s)/numel(p);
% w = cumSumFunc(transpose(r.YData))/numel(p);

% GrayScale
% plot = histSpec(p,q);
% nexttile;
% imshow(p);
% nexttile;
% imshow(q);
% d=cat(3,plot);
% nexttile
% imshow(d);

% % Colored
% r1=x(:,:,1);
% g1=x(:,:,2);
% b1=x(:,:,3);
% r2=y(:,:,1);
% g2=y(:,:,2);
% b2=y(:,:,3);
% a=histSpec(r1,r2);
% b=histSpec(g1,g2);
% c=histSpec(b1,b2);
% nexttile;
% imshow(x);
% nexttile;
% imshow(y);
% d=cat(3,a,b,c);
% nexttile
% imshow(d);
