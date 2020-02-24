% Courtesy: https://www.youtube.com/watch?v=ZOXOwYUVCqw&feature=youtu.be
% Time: 15:03
function data = loadImages(filename)
    fp = fopen(filename, 'rb');
    assert(fp ~= -1, ['Could not open file [', filename, ']!']);

    magic = fread(fp, 1, 'int32', 0, 'ieee-be');
    assert(magic == 2051, ['Bad magic number of [', num2str(magic), ...
        '] in file [', filename, ']']);
    
    % Next three values describe data dimensions
    numImages = fread(fp, 1, 'int32', 0, 'ieee-be');
    numRows = fread(fp, 1, 'int32', 0, 'ieee-be');
    numCols = fread(fp, 1, 'int32', 0, 'ieee-be');
    
    % Read out the chunk of image data
    data = fread(fp, inf, 'unsigned char=>unsigned char');
    % Format/arrange the data
    data = reshape(data, numCols, numRows, numImages);
    data = permute(data, [2 1 3]);
    data = reshape(data, size(data, 1) * size(data, 2), size(data, 3));
    % 8-bit images
    data = double(data) / 255;
    data = reshape(data, 28, 28, []);
    
    fclose(fp);
end