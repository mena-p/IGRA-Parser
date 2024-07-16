# IGRA-Parser
NOAA's [Integrated Global Radiosonde Archive](https://www.ncei.noaa.gov/products/weather-balloon/integrated-global-radiosonde-archive) is a large archive of atmospheric sounding data. The IGRA-Parser can extract data from sounding or derived parameter files into a more versatile data format for MATLAB. 

The data are extracted into an array of sounding objects, each containing all the information in the sounding, such as station ID, date, time, location, number of measurements, measurement data, etc. The file to be parsed must be in the [sounding file format](https://www.ncei.noaa.gov/data/integrated-global-radiosonde-archive/doc/igra2-data-format.txt) or in the [parameter file format](https://www.ncei.noaa.gov/data/integrated-global-radiosonde-archive/doc/igra2-derived-format.txt) of IGRA v2 or v2.2.

# Usage
Simply call the appropriate function on the file you wish to parse:
```
% Parse derived parameter file
parsed_soundings = parse_derived('test_data.txt');

% Filter soundings based on the presence of the mixed layer height parameter
filtered_soundings = filter_soundings(parsed_soundings);

% Extract and return only the relevant data in a sounding
reduced_sounding = extract_sounding_data(filtered_soundings(1));

% Plot pressure, temperature, potential temperature and virtual 
% temperature profiles over geopotential height. The geoportential 
% height is used as the vertical coordinate.
plot_sounding(reduced_sounding, 1.3);

```
