clear;clc;
opts = detectImportOptions('complex_data.xlsx');
opts.SelectedVariableNames = [13 6]; 
[cases_per1000, country_code] = readvars('complex_data.xlsx',opts);

max_case = max(cases_per1000)/4;
scaled_cases = [cases_per1000/max_case];
S = shaperead('bor.shp');

tmp = extractfield(S, 'ISO3');
tmp =string(tmp);

numRegions = length(S);
% show the map
mapshow(S)
% get the current colormap
cmap = [1 1 1];
numColors = size(cmap,1);
data = randi(numColors,1,numRegions);


for i=1:length(country_code)
    if(ismember(country_code(i), tmp))
    tmp2 = scaled_cases(i)
    if(tmp2 >1)
        tmp2=1;
    end
    cmap = [1-tmp2 1-tmp2 1]
    i
    val = find(tmp == country_code(i))
    mapshow(S(val),'FaceColor',cmap(data(i),:))
    tmp(val)
    country_code(i)
    end
end

% numRegions = length(S);
% % show the map
% mapshow(S)
% % get the current colormap
% cmap = colormap;
% numColors = size(cmap,1);
% % create some random data [1 numRegions], each data point is associated with a region
% data = randi(numColors,1,numRegions);
% % set the colors of the regions using the 'FaceColor' -property
% for i = 1:length(S)
%     % FaceColor is now a color from the current colormap, determined by
%     % it's data value
%     mapshow(S(i),'FaceColor',cmap(data(i),:))
% end