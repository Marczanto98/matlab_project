function plot_top10cases
opts = detectImportOptions('complex_data.xlsx');
opts.SelectedVariableNames = [1 4 5]; 
[cases, country_nr, country] = readvars('complex_data.xlsx',opts);

for i=1:length(country)
    tmp = strrep(country(i),'_',' ');
    country(i)=tmp;
end

countries = [string(country) country_nr];
data = [cases country_nr];
data = sortrows(data, 'descend');

tmp_d = data(1,1);
tmp_c = countries(data(1,2), 1);
for i=2:10
    tmp_d = [tmp_d data(i,1)];
    tmp_c = [tmp_c countries(data(i,2))];
end


bar(tmp_d)
set(gca, 'xticklabel', tmp_c)
ylabel("cases")
xlabel("country")