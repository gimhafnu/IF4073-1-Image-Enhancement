function neo_Img = contrast_enhancment(I)
    I_new = zeros(size(I),'uint8');
    for i=1:size(I,3)
        I_temp = I(:,:,i);
        rmin = min(I_temp(:));
        rmax = max(I_temp(:));
    
        % Akhirnya pake yang tipe 1 karena yang tipe 2 for some reason selalu
        % ngasih warana putih... (TBH yang dari bapaknya juga sama sih...)
        I_new(:,:,i) = (I_temp - rmin).*(255./(rmax - rmin));
    end
    
    neo_Img = I_new;
end