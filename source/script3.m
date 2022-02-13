clear all;
clc;
I = imread("3-1.jpg");

I_new = histogram_eq(I);

show_img_hist(I);
show_img_hist(I_new);


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