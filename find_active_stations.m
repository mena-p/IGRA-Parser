function active_stations = find_active_stations(location, date,start_dist)
    % FIND_NEARBY_STATIONS - Filter stations based on flight date and position range
    %
    % Syntax:
    %   stations = find_nearby_stations(location, date)
    %
    % Inputs:
    %   locations - [lat lon] vector of the location to search for stations
    %   date - datetime object of the day to search for stations
    %   max_dist - starting search radius
    % 
    %  Outputs:
    %   active_stations: Filtered table of stations that meet the criteria.

    % Load stations
    load('stations.mat', 'stations');
    
    % Get flight date
    date.TimeZone = 'UTC';
    flightYear = year(date);

    lat = location(1);
    lon = location(2);
    
    
    
    % Initialize output
    active_stations = [];
    while(isempty(active_stations))

        % Only keep stations working during the flight year
        mask = [stations.firstYear] <= datenum(flightYear) & [stations.lastYear] ...
        >= datenum(flightYear);
        filtered_stations = stations(mask, :);

        % Filter out stations further away than max_dist
        dist1 = distance([filtered_stations.lat], [filtered_stations.lon], lat, lon,...
            wgs84Ellipsoid);
        mask = dist1 < start_dist;
        filtered_stations = filtered_stations(mask,:);

        % Find out which stations are not up to date and update their files
        old_stations = filtered_stations(filtered_stations.lastUpdate < date, :);
        if(~isempty(old_stations))
            download_station_files(old_stations);
        end

        % Find out which stations are active on the day of the flight with the cache
        active_stations = [];
        for i = 1:size(filtered_stations,1)
            station = filtered_stations(i,:);
            filename = fullfile('Cache', strcat(station.ID, '-cache.mat'));
            if isfile(filename)
                load(filename, 'cache');
                if any(cache.date == date)
                    active_stations = [active_stations; station];
                end
            else
                % Check if the user is in the correct directory
                if ~isfolder('Cache')
                    error('It seems like you are not running the gui from the root directory. Please change the current directory to the root directory and try again.');
                else
                    purge_cache();
                    error('Cache file not found. This can happen if the cache file was manually deleted. The cache has been purged automatically, which should solve the problem. If it does not, please manually set the lastUpdate column of the stations.mat table to 01.01.0000 and save it to the station.mat file. Restart the GUI and try again.');
                end
            end
        end
        % If no stations are active, increase the distance
        start_dist = start_dist + 200000;
    end
end