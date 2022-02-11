clear all;
clc;
I = imread("3-4.jpg");
Histogram = zeros(256, size(I,3));
eq_Histogram = zeros(256, size(I,3));
I_new = zeros(size(I),'uint8');
MN = size(I,1) * size(I,2);

%I_temp = I(:);
for x=1:size(I,3)
    fprintf("x = ");
    disp(x);
    for i = 1:size(I,1)
        %fprintf("i = ");
        %disp(i);
        for j = 1:size(I,2)
            %fprintf("j = ");
            %disp(j);
            Histogram(I(i,j,x)+1,x) = Histogram(I(i,j,x)+1,x) + 1;
            % +1 ke setiap manggil Histogram karena array MatLab dimulai
            % dari 1
        end
        %disp(i);
    end
    
    %disp(Histogram);
    for i = 1:256
        sum = 0.0;
        for j = 1:i
            sum = sum + Histogram(j,x);
        %eq_Histogram(i) = floor(255*sum);
        eq_Histogram(i,x) = floor(256*(sum/MN));
        end
    end
    
    for i = 1:size(I,1)
        for j = 1:size(I,2)
            I_new(i,j,x) = eq_Histogram(I(i,j,x)+1,x)-1;
            % +1 ke setiap manggil Histogram karena array MatLab dimulai
            % dari 1
            % LALU -1 saat ngasih ke I_new supaya bisa jadi nilai 0 lagi
            % kayak gambar semestinya
        end
        %disp(i);
    end
end

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