function hist = myimhist(image)
    [x,y] = size(image);
    graylevel = 1 : 256;
    count = 0; 
    for i = 1 : 256
        for j = 1 : x
            for k = 1 : y
                if image(j, k) == i-1
                    count = count + 1;
                end
            end
        end
        graylevel(i) = count;
        count = 0;  
    end
    n = 0 : 255;
    hist = bar(n, graylevel);
end

