function heatmap
opts = detectImportOptions('complex_data.xlsx');
opts.SelectedVariableNames = [13 5]; 
[cases_per1000, country] = readvars('complex_data.xlsx',opts);

S = shaperead('bor.shp');
numRegions = length(S);
% show the map
mapshow(S)
% get the current colormap
cmap = colormap;
numColors = size(cmap,1);
% create some random data [1 numRegions], each data point is associated with a region
data = randi(numColors,1,numRegions);
% set the colors of the regions using the 'FaceColor' -property
for i = 1:length(S)
    % FaceColor is now a color from the current colormap, determined by
    % it's data value
    mapshow(S(i),'FaceColor',cmap(data(i),:))
end


end