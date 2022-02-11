function neo_Img = histogram_eq(I)
    Histogram = zeros(256, size(I,3));
    eq_Histogram = zeros(256, size(I,3));
    I_new = zeros(size(I),'uint8');
    MN = size(I,1) * size(I,2);
    
    for x=1:size(I,3)
        for i = 1:size(I,1)
            for j = 1:size(I,2)
                Histogram(I(i,j,x)+1,x) = Histogram(I(i,j,x)+1,x) + 1;
                % +1 ke setiap manggil Histogram karena array MatLab dimulai
                % dari 1
            end
            %disp(i);
        end
    end
        
        %disp(Histogram);
    for i = 1:256
        sum = 0.0;
        for j = 1:i
            for x=1:size(I,3)
                sum = sum + Histogram(j,x);
            end
        %eq_Histogram(i) = floor(255*sum);
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
            %disp(i);
        end
    end
    neo_Img = I_new;
end