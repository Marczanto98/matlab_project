clear; clc;

opts = detectImportOptions('complex_data.xlsx');
opts.SelectedVariableNames = [13 5]; 
[cases_per1000, country] = readvars('complex_data.xlsx',opts);
S = load('borderdata.mat');
country2 = S.places;
country2 = string(country)

borders('countries','b')
a = country(45)
b = country(13)
country = string(country);
for i=1:length(country)
    country(i)=strrep(country(i),'_',' ');
    country(i)=strrep(country(i),'-',' ');
end

country(81)= 'Gwuwine and Bissau';

a = country(45)
b = country(13)
for i=1:length(country)
    i
    borders(country(i),'facecolor',[0 1 0])
end

% borders('United states','facecolor',[0 1 0])


axis tight
