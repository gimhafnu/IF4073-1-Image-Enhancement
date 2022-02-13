% image = imread('Larutan.tif');
% citraBerwarnaHist(image)

function myrgbhist(image)
    redChannel = image(:,:,1);
    greenChannel = image(:,:,2);
    blueChannel = image(:,:,3);
    subplot(2,2,1);
    fontSize = 10;
    r = myimhist(redChannel).YData;
    r.FaceColor = 'red';
    title('Red Channel', 'FontSize', fontSize);
    subplot(2,2,2);
    g = myimhist(greenChannel).YData;
    g.FaceColor = 'green';
    title('Green Channel', 'FontSize', fontSize);
    subplot(2,2,3);
    b = myimhist(blueChannel).YData;
    b.FaceColor = 'blue';
    title('Blue Channel', 'FontSize', fontSize);

end
