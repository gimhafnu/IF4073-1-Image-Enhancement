function fig = histSpec(p,q)
    Inverse = zeros(256,1,'uint8'); 
    hist1 = myimhist(p).YData; 
    hist2 = myimhist(q).YData;
    cdf1 = cumSumFunc(transpose(hist1)) / numel(p);
    cdf2 = cumSumFunc(transpose(hist2)) / numel(q);

    for i = 1 : 256
        [~,idx] = min(abs(cdf1(i) - cdf2));
        Inverse(i) = idx-1;
    end

    [H, W] = size(p);
    fig=zeros(H,W,'uint8');

    for x = 1: H
        for y = 1:W
            fig(x,y) =Inverse(double(p(x,y))+1);
        end
    end
%     d=cat(3,plot);
%     nexttile
%     imshow(d);
end


