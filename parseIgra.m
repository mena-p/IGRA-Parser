function soundingData = parseIgra(filename)
%This function parses a IGRA atmospheric sounding file.
%   Detailed explanation goes here

file = fopen(filename, 'rt');
if file == -1
    error('Cannot open file: %s', filename);
end


% Read the header record
headerLine = fgetl(file);
if headerLine(1) ~= '#'
    error('Invalid header record in file: %s', filename);
end

opts = detectImportOptions(filename)

% Parse header record
header = readtable(filename, opts);
soundingData.header.ID = header{1}{1};
soundingData.header.YEAR = header{2};
soundingData.header.MONTH = header{3};
soundingData.header.DAY = header{4};
soundingData.header.HOUR = header{5};
soundingData.header.RELTIME = header{6};
soundingData.header.NUMLEV = header{7};
soundingData.header.P_SRC = header{8}{1};
soundingData.header.NP_SRC = header{9}{1};
soundingData.header.LAT = header{10};
soundingData.header.LON = header{11};
soundingData = file;
fclose(file);
end
