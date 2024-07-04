# IGRA-Parser
NOAA's [Integrated Global Radiosonde Archive](https://www.ncei.noaa.gov/products/weather-balloon/integrated-global-radiosonde-archive) is a large archive of atmospheric sounding data. The IGRA-Parser extracts data from any sounding data file into a more versatile data format for MATLAB. 

The data are extracted into an array of sounding objects, each containing all the information in the sounding, such as station ID, date, time, location, number of measurements, ..., and the measurements themselves. The file to be parsed must be in the [sounding data format](https://www.ncei.noaa.gov/data/integrated-global-radiosonde-archive/doc/igra2-data-format.txt) of IGRA v2 or v2.2.

# Usage
Simply call the function on the file you wish to parse:
```
exampleOutput = parse_igra('GMM00010868-data.txt');
```
