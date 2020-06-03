%function update complex_data spredsheet with actual coronavirus data
%

function complexData
opts = detectImportOptions('covid_data.xlsx');
opts.SelectedVariableNames = [5 6 7 9 10 11]; 
[cases,deaths, countries, countryCode, pop, continent] = readvars('covid_data.xlsx',opts);

country_and_code_table = [string(countries(1)) string(countryCode(1)) string(continent(1))];
data_table = [cases(1) deaths(1) pop(1) 1];

country = 1;
for i=2:length(cases)
    if(countryCode(i-1) == string(countryCode(i)))
       data_table(country, 1) = data_table(country, 1)+ cases(i); 
       data_table(country, 2) = data_table(country, 2)+ deaths(i); 
    else
        if(pop(i)>0 && string(continent(i)) ~= "Other")
            data_table =[data_table; [cases(i) deaths(i) pop(i) country+1]]; %skip countries without info about population
            country_and_code_table = [country_and_code_table; [string(countries(i)) string(countryCode(i)) string(continent(i))]];
            country = country +1;
       end
    end
end

complex_data_filename = 'complex_data.xlsx';
writematrix(data_table,complex_data_filename,'Sheet',1,'Range','A1');
writematrix(country_and_code_table,complex_data_filename,'Sheet',1,'Range','E1');

cases_per_pop = [(data_table(1, 1)/data_table(1, 3))*1000];
deaths_per_pop = [(data_table(1, 2)/data_table(1, 3))*1000];
death_rate = [data_table(1, 2)/data_table(1, 1)];

for i=2:length(data_table) 
    cases_per_pop = [cases_per_pop;[(data_table(i, 1)/data_table(i, 3))*1000]];
    deaths_per_pop = [deaths_per_pop;[(data_table(i, 2)/data_table(i, 3))*1000]];
    death_rate = [death_rate; [data_table(i, 2)/data_table(i, 1)]];
end

writematrix(cases_per_pop,complex_data_filename,'Sheet',1,'Range','M1');
writematrix(deaths_per_pop,complex_data_filename,'Sheet',1,'Range','N1');
writematrix(death_rate,complex_data_filename,'Sheet',1,'Range','O1');

end