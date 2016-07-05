
% Data set name
dataset = 'Drishti';

% Identify the machine
[ret, hostname] = system('hostname');
hostname = strtrim(lower(hostname));

% Lab computer
if strcmp(hostname, 'orlando-pc')
    % Folder where the features and labels are
    rootFolder = 'C:\_glaucoma\_resources\data';
    % Folder where the results will be saved
    resultsFolder = 'C:\_glaucoma\results';
elseif strcmp(hostname, 'animas')
    % Folder where the features and labels are
    rootFolder = '/home/ignacioorlando/nacho-research/cnn2015glaucoma/_resources/data';
    % Folder where the results will be saved
    resultsFolder = '/home/ignacioorlando/nacho-research/cnn2015glaucoma/results';
end

% Indicate if the CDR will be included
options.useCDR = false;

% Different preprocessings of the images. Warning: all will be explored!
preprocessings = { ...
    'color'...
    'color-inp' ...
    'green' ...
    'green-inp' ...
    'norm-color'...
    'norm-color-inp'...
    'clahe-color'...
    'clahe-color-inp'...
    'green-clahe'...
    'green-clahe-inp'...
};  
preprocessings_names = { ...
    'RGB'...
    'RGB + inpainting' ...
    'G' ...
    'G + inpainting' ...
    'Normalized RGB'...
    'Normalized RGB + inpainting'...
    'RGB + CLAHE'...
    'RGB + CLAHE + inpainting'...
    'G + CLAHE'...
    'G + CLAHE + inpainting'...
};  

% Regularizers. Warning: all will be explored!
%regularizers = {'L1','L2','k-support'};
regularizers = {'L1', 'L2'};

% Augmentation strategies. Warning: all will be explored!
augmented = {'', '-aug-90', '-aug'};
augmentedNames = {'Not augmented', 'Flipped and rotated 90�', 'Flipped and rotated 45�'};

% Zooms. Warning: all will be explored!
dataUsed = {'', 'fov-crop', 'od' , 'only-od'};
dataUsedNames = {'Original image', 'Cropped FOV', 'Peripapillary area', 'ONH'};

% Measure to optimize
options.measure = 'auc';
%options.measure = 'acc';
% Verbose option
options.verbose = false;

% % Type of experiment: Cross validation
% options.experimentType = 'cross-validation';
% % Number of folds
% options.folds = 10;
% Type of experiment: Multiple trials
options.experimentType = 'multiple-trials';
% Number of folds
options.numTrials = 100;
% Training fraction
options.trainingFraction = 0.7;

% Lambda values
% options.lambdaValues = 10.^(-1:1:1); % lambda values
options.lambdaValues = 10.^(-5:1:6); % lambda values