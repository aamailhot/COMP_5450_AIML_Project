% ==============================================
% === Define constants (config for the tool) ===
% ==============================================
% Useful for adding paths relative to this script's location
% (since each user may be seeing the top level of the repo differently)
thisFilesPath = fileparts(mfilename('fullpath'));
rootFolder = fileparts(thisFilesPath);

labelFile = 'train-labels-MINST.idx1-ubyte';

% ==============================================
% ===    PLACE ADDPATHS HERE AS NEEDED       ===
% ==============================================
run([rootFolder, filesep, 'setup_paths_all.m']);
% Add more like this!
%run([rootFolder, filesep, 'setup_paths_OTHERS.m']);

dataLabels = loadData(labelFile);