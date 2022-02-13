function X = cumSumFunc(image)
    [m,n] = size(image);
    X = zeros(m,n);
    X(1,:) = image(1,:);
    for i=2:m
        for j=1:n
            X(i,j) = image(i,j) + X(i-1,j);
        end
    end
end