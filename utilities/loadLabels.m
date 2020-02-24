% Courtesy: https://www.youtube.com/watch?v=ZOXOwYUVCqw&feature=youtu.be
% Time: 14:30
function data = loadLabels(filename)
    fp = fopen(filename, 'rb');
    assert(fp ~= -1, ['Could not open file [', filename, ']!']);

    magic = fread(fp, 1, 'int32', 0, 'ieee-be');
    assert(magic == 2049, ['Bad magic number of [', num2str(magic), ...
        '] in file [', filename, ']']);
    
    numLabels = fread(fp, 1, 'int32', 0, 'ieee-be');
    data = fread(fp, inf, 'unsigned char');
    assert(size(data,1) == numLabels, ['Mismatch in label count!', ...
        'field:[', numLabels, '], calculated:[', size(data,1), '].']);
    
    fclose(fp);
end