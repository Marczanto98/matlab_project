function plot_low10casesPer1000
opts = detectImportOptions('complex_data.xlsx');
opts.SelectedVariableNames = [13 4 5]; 
[cases1000, country_nr, country] = readvars('complex_data.xlsx',opts);

countries = [string(country) country_nr];
data = [cases1000 country_nr];
data = sortrows(data);

%tables of 10 countires with top deaths
tmp_d = data(1,1);
tmp_c = countries(data(1,2), 1);
for i=2:10
    tmp_d = [tmp_d data(i,1)];
    tmp_c = [tmp_c countries(data(i,2))];
end

figure
bar(tmp_d)
set(gca, 'xticklabel', tmp_c)
ylabel("cases per 1000 people")
xlabel("country")

end