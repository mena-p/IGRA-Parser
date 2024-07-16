
clear
close

% Usage:

% Parse derived parameter file
parsed_soundings = parse_derived('test_data.txt');

% Filter soundings based on the presence of the inversion height parameter
filtered_soundings = filter_soundings(parsed_soundings);

% Extract and return only the relevant data in a sounding
reduced_sounding = extract_sounding_data(filtered_soundings(1));

% Plot pressure, temperature, potential temperature and virtual 
% temperature profiles over geopotential height. The geoportential 
% height is used as the vertical coordinate.
plot_sounding(reduced_sounding);

