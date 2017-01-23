function fil = getGLPyramid(im, N)

gaussianFil = cell(N, 1);
laplacianFil = cell(N, 1);

stdDev = 2;

filter = fspecial('gaussian', 2*stdDev + 1, stdDev);

gaussianFil{1} = im;

for i = 1:N-1
    filterImage = imfilter(gaussianFil{i}, filter);
    gaussianFil{i+1} = filterImage(1:2:end, 1:2:end, :);
    laplacianFil{i} = gaussianFil{i} - imfilter(imresize(gaussianFil{i+1}...
                      , [size(gaussianFil{i},1) size(gaussianFil{i}, 2)],...
                         'nearest'), filter);    
end

laplacianFil{N} = gaussianFil{N};
end