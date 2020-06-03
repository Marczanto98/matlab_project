function heatmap
opts = detectImportOptions('complex_data.xlsx');
opts.SelectedVariableNames = [13 6]; 
[cases_per1000, country_code] = readvars('complex_data.xlsx',opts);

max_case = max(cases_per1000)/4;
scaled_cases = [cases_per1000/max_case];
S = shaperead('bor.shp');

tmp = extractfield(S, 'ISO3');
tmp =string(tmp);

numRegions = length(S);
mapshow(S)
cmap = [1 1 1];
numColors = size(cmap,1);
data = randi(numColors,1,numRegions);

for i=1:length(country_code)
    if(ismember(country_code(i), tmp))
    tmp2 = scaled_cases(i);
    if(tmp2 >1)
        tmp2=1;
    end
    cmap = [1-tmp2 1-tmp2 1];
    val = find(tmp == country_code(i));
    mapshow(S(val),'FaceColor',cmap(data(i),:))
    end
end

end