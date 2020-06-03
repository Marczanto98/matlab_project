function correlations(val1, val2, xname, yname)

opts = detectImportOptions('complex_data.xlsx');
opts.SelectedVariableNames = [val1 val2]; 
[death_rate, age] = readvars('complex_data.xlsx',opts);

x = [death_rate age];
%[R,Pvalue,H] = 
% fig = corrplot(x, 'type', 'Kendall','rows', 'pairwise', 'testR','on')
plot(death_rate, age, 'b.')
ylabel(yname)
xlabel(xname)

end
