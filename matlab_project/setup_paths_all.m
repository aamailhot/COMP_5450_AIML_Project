% Useful for adding paths relative to this script's location
% (since each user may be seeing the top level of the repo differently)
thisFilesPath = fileparts(mfilename('fullpath'));
rootFolder = thisFilesPath;

% === PUT ADDPATHS HERE ===
addpath(rootFolder);
addpath(genpath([rootFolder, filesep, '..', filesep, 'data']));
addpath(genpath([rootFolder, filesep, 'drivers']));
addpath(genpath([rootFolder, filesep, 'utilities']));