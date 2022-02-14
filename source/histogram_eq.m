function neo_Img = histogram_eq(I)
    Histogram = zeros(256, size(I,3));
    eq_Histogram = zeros(256, 1);
    I_new = zeros(size(I),'uint8');
    MN = size(I,1) * size(I,2);
    
    for x=1:size(I,3)
        Histogram(:,x) = transpose(myimhist(I(:,:,x)).YData);
    end
        
    for i = 1:256
        sum = 0.0;
        for j = 1:i
            for x=1:size(I,3)
                sum = sum + Histogram(j,x);
            end
        eq_Histogram(i) = floor(256*((sum/size(I,3))/MN));
        end
    end
        
    for x=1:size(I,3)
        for i = 1:size(I,1)
            for j = 1:size(I,2)
                I_new(i,j,x) = eq_Histogram(I(i,j,x)+1)-1;
                % +1 ke setiap manggil Histogram karena array MatLab dimulai
                % dari 1
                % LALU -1 saat ngasih ke I_new supaya bisa jadi nilai 0 lagi
                % kayak gambar semestinya
            end
        end
    end
    neo_Img = I_new;
end