clear all;
clc;

I = imread("2-1.jpg");  
disp(size(I,3));

I_new = contrast_expand(I);

show_img_hist(I);
show_img_hist(I_new);

function show_img_hist(image_matrix)
    figure,imshow(image_matrix);
    if size(image_matrix,3) == 3
        R=myimhist(image_matrix(:,:,1)).YData;
        G=myimhist(image_matrix(:,:,2)).YData;
        B=myimhist(image_matrix(:,:,3)).YData;

        %d=cat(3,R,G,B);
        %figure,imshow(d);

        figure, plot(R,'r')
        hold on, plot(G,'g')
        plot(B,'b'), legend('Red channel','Green channel','Blue channel'),
        hold off;
    else
        figure,myimhist(image_matrix).YData;
    end
end
