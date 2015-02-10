function parameters = loadParameters( path )
%LOADPARAMETERS Load parameter set from JSON file
%   Loads the JSON-formatted file specified by PATH into a MATLAB struct
%   containing the parameters defined within the JSON structure.
%
%   Sean Leavey
%   s.leavey.1@research.gla.ac.uk
%   May 2014

%% read contents of specified file

% open file
fileId = fopen(path);

% read char-encoded content
fileContent = fread(fileId, inf);

% convert to string
stringContent = char(fileContent');

% close file
fclose(fileId);

%% convert JSON to MATLAB struct
parameters = JSON.parse(stringContent);

%% parse special strings

%%%%%
% convert occurrences of 'inf' string to MATLAB inf (JSON doesn't have a
% proper way to handle the number infinity so it's defined as a string)

% define recursive function
    function token = convertInf(token)
        if isstruct(token)
            fields = fieldnames(token);
            
            for n = 1 : numel(fields)
                token.(fields{n}) = convertInf(token.(fields{n}));
            end
        else
            if strcmp(token, 'Infinity')
                token = inf;
            elseif strcmp(token, '-Infinity')
                token = -inf;
            end
        end
    end

% convert infinities
parameters = convertInf(parameters);

end

