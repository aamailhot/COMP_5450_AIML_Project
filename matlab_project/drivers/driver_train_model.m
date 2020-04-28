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

% ==============================================
% ===    INITIAL RAW IMAGES                  ===
% ==============================================
% ====
figure;
idx = uint32(rand(1)*60000);
colormap(gray(256));
% Plot some images
imagesc(dataTrainImages(:, :, idx), [-1 1]);
% ====
figure;
perm = randperm(10000,20);
for i = 1:20
    subplot(4,5,i);
    imshow(dataTrainImages(:, :, perm(i)));
end

