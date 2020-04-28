%close all

% === CONFIG ===
topDir = 'D:\git_repos\COMP_5450_ML_Project\data\DDSM';

imgHeight = 256;
imgWidth = 128;

convL1_filterSize = 5;
convL1_numNeurons = 8;
convL2_filterSize = 5;
convL2_numNeurons = 16;
convL3_filterSize = 5;
convL3_numNeurons = 32;

poolL1_sizeAndStride = 2;
poolL2_sizeAndStride = 2;
% === DONE - CONFIG ===

% ====================
% Load data
% ====================
imgs = imageDatastore(topDir,'IncludeSubfolders',true,'LabelSource','foldernames');
    
% ====================
% Split the data
% ====================
percentTrain = 0.75;
[imgsTrain,imgsValidation] = splitEachLabel(imgs,percentTrain,'randomize');

% ====================
% Define the CNN architecture
% ====================
layers = [
    imageInputLayer([imgHeight imgWidth 1])
    
    convolution2dLayer(convL1_filterSize, ...
        convL1_numNeurons,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(poolL1_sizeAndStride, ...
        'Stride',poolL1_sizeAndStride)
    
    convolution2dLayer(convL2_filterSize, ...
        convL2_numNeurons,'Padding','same')    
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(poolL2_sizeAndStride, ...
        'Stride',poolL2_sizeAndStride)
    
    convolution2dLayer(convL3_filterSize, ...
        convL3_numNeurons,'Padding','same') 
    batchNormalizationLayer
    reluLayer
    
    % Positive or Negative for cancer
    fullyConnectedLayer(2)
    
    softmaxLayer
    classificationLayer];

% ====================
% Set training options, such as hyper-parameters
% ====================
options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.001, ...
    'MaxEpochs',30, ...
    'Shuffle','every-epoch', ...
    'ValidationData',imgsValidation, ...
    'ValidationFrequency',30, ...
    'Verbose',false, ...
    'Plots','training-progress');

% ====================
% Execute the training!
% ====================
net = trainNetwork(imgsTrain,layers,options);

% ====================
% Quality Metrics
% ====================
YPred = classify(net,imgsValidation);
YValidation = imgsValidation.Labels;

accuracy = sum(YPred == YValidation)/numel(YValidation)
