function GMM00010868data = igra_to_table(filename, startRow, endRow)
%IMPORTFILE1 Import numeric data from a text file as a matrix.
%   GMM00010868DATA = IMPORTFILE1(FILENAME)
%   Reads data from text file FILENAME for the default selection.
%
%   GMM00010868DATA = IMPORTFILE1(FILENAME, STARTROW, ENDROW)
%   Reads data from rows STARTROW through ENDROW of text file FILENAME.
%
% Example:
%   GMM00010868data = importfile1('GMM00010868-data.txt', 2, 74);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2024/07/03 19:11:05

%% Initialize variables.
if nargin<=2
    startRow = 2;
    endRow = 74;
end

%% Format for each line of text:
%   column1: double (%f)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
%   column5: categorical (%C)
%	column6: double (%f)
%   column7: categorical (%C)
%	column8: double (%f)
%   column9: categorical (%C)
%	column10: double (%f)
%   column11: double (%f)
%	column12: double (%f)
%   column13: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%1f%1f%6f%7f%1C%5f%1C%5f%1C%5f%6f%6f%6f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this code. If an error occurs for a different file, try regenerating the code from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'HeaderLines', startRow(1)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'HeaderLines', startRow(block)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post processing code is included. To generate code which works for unimportable data, select unimportable cells in a file and regenerate the script.

%% Create output variable
GMM00010868data = table(dataArray{1:end-1}, 'VariableNames', {'LVLTYP1','LVLTYP2','ETIME','PRESS','PFLAG','GPH','ZFLAG','TEMP','TFLAG','RH','DPDP','WDIR','WSPD'});

