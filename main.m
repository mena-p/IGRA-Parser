
clear
close

% Workflow:

% Parse derived parameter file
parsed_soundings = parse_derived('test_data.txt');

% Filter soundings based on the presence of the mixed layer height
% parameter. Soundings where the parameter does not exist are removed.
filtered_soundings = filter_soundings(parsed_soundings);

% Extract and return only the relevant data in a sounding. Extracts
% geopotential height, pressure, temperature, potential temperature and
% virtual temperature. Missing reported geopotential heights (REPGPH) 
% are filled with calculated values (CALCGPH).
reduced_sounding = extract_sounding_data(filtered_soundings(1));

% Remove all measurements that have a geopotential height REPGPH
% greater than 1.3 times the mixed layer height.
capped_sounding = remove_values_above(reduced_sounding, 1.3);

% Interpolate missing values in the sounding with an interval of 1 meter
interpolated_sounding = interpolate_missing(capped_sounding);

% Plot pressure, temperature, potential temperature and virtual 
% temperature profiles over geopotential height, up to 1.1 times the
% mixed layer height.
plot_sounding(interpolated_sounding, 1.1);


