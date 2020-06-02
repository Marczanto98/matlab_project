%update data about coronavirus cases
function update_data
fileName = 'covid_data.xlsx';
fullURL = 'https://www.ecdc.europa.eu/sites/default/files/documents/COVID-19-geographic-disbtribution-worldwide.xlsx';
urlwrite(fullURL,fileName);
end