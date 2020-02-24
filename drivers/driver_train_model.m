% ==============================================
% === Define constants (config for the tool) ===
% ==============================================
% Useful for adding paths relative to this script's location
% (since each user may be seeing the top level of the repo differently)
thisFilesPath = fileparts(mfilename('fullpath'));
rootFolder = fileparts(thisFilesPath);

%filenameTrainLabels = 'Fashion-MNIST-train-labels-idx1-ubyte';

filenameTrainLabels = 'MNIST-train-labels-idx1-ubyte';
filenameTrainImages = 'MNIST-train-images-idx3-ubyte';

% ==============================================
% ===    PLACE ADDPATHS HERE AS NEEDED       ===
% ==============================================
run([rootFolder, filesep, 'setup_paths_all.m']);
% Add more paths like this!
%run([rootFolder, filesep, 'setup_paths_OTHERS.m']);

% ==============================================
% ===    LOAD THE DATA                       ===
% ==============================================
dataTrainLabels = loadLabels(filenameTrainLabels);
dataTrainImages = loadImages(filenameTrainImages);

% Test one image display!
idx = uint32(rand(1)*60000);
colormap(gray(256));
imagesc(dataTrainImages(:, :, idx), [-1 1]);