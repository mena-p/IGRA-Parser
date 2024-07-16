function reduced_sounding = extract_sounding_data(sounding)
    % Extract and return only the relevant data in a sounding,
    % and return a reduced sounding object.
    % The following parameters are extracted:
    % - mixed layer height
    % - lifting condensation level
    % The following profiles are extracted:
    % - geopotential heights
    % - pressure profile
    % - temperature profile
    % - potential temperature profile
    % - virtual temperature profile
    % Input: sounding - a sounding object
    % Output: reduced_sounding - a reduced sounding containing only the 
    % extracted values.

    % Initialize a reduced sounding object and copy the relevant attributes
    reduced_sounding.mixedLayerHeight = sounding.mixedLayerHeight;
    reduced_sounding.LCLheight = sounding.LCLheight;

    % Extract the relevant columns from the sounding data table
    reduced_sounding.derived = sounding.derived(:,["REPGPH","CALCGPH","PRESS","TEMP","PTEMP","VTEMP"]);

    % If a row contains missing REPGPH values, fill it with the corresponding 
    % CALCPGH values
    reduced_sounding.derived.REPGPH(isnan(reduced_sounding.derived.REPGPH)) = reduced_sounding.derived.CALCGPH(isnan(reduced_sounding.derived.REPGPH));

    % If some rows still contain missing REPGPH values, remove them
    reduced_sounding.derived = rmmissing(reduced_sounding.derived,'DataVariables','REPGPH');

    % Remove the CALCGPH column
    reduced_sounding.derived.CALCGPH = [];
end