%% Find active stations

% Specify the location and date where you want to search for active stations
location = [40.7128 -74.0060]; % New York City
date = datetime('19 July 2023','Format','dd MMMM yyyy','TimeZone','UTC');

% Find active stations
active_stations = find_active_stations(location, date,10000);

% This will search for and download the data for the active stations from the IGRA database.

%% Search the active stations for soundings on that date
found_soundings = [];
    for i = 1:size(active_stations,1)
        station = active_stations(i,:);
        found = parse_derived_by_date(station.ID, date);
        found_soundings = [found_soundings, found];
    end

% This will search for soundings on the specified date at the active stations.