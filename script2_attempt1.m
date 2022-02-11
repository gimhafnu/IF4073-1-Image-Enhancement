clear all;
clc;
I = imread("2-1.jpg");  
disp(size(I,3));
I_new = zeros(size(I),'uint8')
for i=1:size(I,3)
    I_temp = I(:,:,i);
    rmin = min(I_temp(:));
    rmax = max(I_temp(:));

    % TIPE 2 (TAPI GAK JALAN :c)
    %m = 255./(rmax-rmin);
    %c = 255 - m*rmax;
    %I_new(:,:,i) = m*I(:,:,i) + c;

    % Akhirnya pake yang tipe 1 karena yang tipe 2 for some reason selalu
    % ngasih warana putih... (TBH yang dari bapaknya juga sama sih...)
    I_new(:,:,i) = (I_temp - rmin).*(255./(rmax - rmin));
end


show_img_hist(I);
show_img_hist(I_new);
%figure,imshow(I);
%figure,imhist(I);
%figure,imshow(I_new);
%figure,imhist(I_new);


function show_img_hist(image_matrix)
    figure,imshow(image_matrix);
    if size(image_matrix,3) == 3
        R=imhist(image_matrix(:,:,1));
        G=imhist(image_matrix(:,:,2));
        B=imhist(image_matrix(:,:,3));
        figure, plot(R,'r')
        hold on, plot(G,'g')
        plot(B,'b'), legend(' Red channel','Green channel','Blue channel');
        hold off,
    else
        figure,imhist(image_matrix);
    end
end