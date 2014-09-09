%Grain Size Distribution Curve
%   This function uses the results of a sieve analysis and computes the
%   Grain-Size Distribution curve, D10, D30, D50, D60, Cu, and Cc.
function [ output_args ] = GrainSizeDistribution( input_args )

%Calculate data
Soil_Retained = [200, 350, 450, 525, 630, 850, 900, 20, 5]
Sieve_Size = [38, 19, 9.5, 4.75, 0.85 ,0.425, 0.25, 0.075, 0]
Total_Sample_Weight = sum(Soil_Retained)
Cumulative_Soil_Sum = cumsum(Soil_Retained)
Percent_Passing = (Total_Sample_Weight-Cumulative_Soil_Sum)/Total_Sample_Weight*100

D10 = interp1(Percent_Passing,Sieve_Size,10)
D30 = interp1(Percent_Passing,Sieve_Size,30)
D50 = interp1(Percent_Passing,Sieve_Size,50)
D60 = interp1(Percent_Passing,Sieve_Size,60)

Cu = D60/D10
Cc = D30^2/(D10*D60)

%Plot data
graph = figure('visible','off') %Graph does not need to be displayed

hold on

plot(Sieve_Size, Percent_Passing, '.-')
set(gca, 'xscale', 'log', 'XDir', 'reverse')
xlabel('Sieve Size (mm)')
ylabel('Percent Passing (%)')

plot([max(Sieve_Size)*2, D10, D10], [10, 10, min(Sieve_Size)/2], 'gx--')
text(D10,10,['D_1_0=' num2str(D10)])
plot([max(Sieve_Size)*2, D30, D30], [30, 30, min(Sieve_Size)/2], 'rx--')
text(D30,30,['D_3_0=' num2str(D30)])
plot([max(Sieve_Size)*2, D50, D50], [50, 50, min(Sieve_Size)/2], 'kx--')
text(D50,50,['D_5_0=' num2str(D50)])
plot([max(Sieve_Size)*2, D60, D60], [60, 60, min(Sieve_Size)/2], 'yx--')
text(D60,60,['D_6_0=' num2str(D60)])

title(['C_u=', num2str(Cu), ', C_c=', num2str(Cc)])

%Save the graph as 'dist_curv.jpg' for transfer back from htcondor
saveas(graph,'dist_curv','jpg')

hold off

end

%Call function GrainSizeDistribution
%    This call could be done in a separate file with other function calls
%    if desired, just be sure to transfer both the file with the function
%    calls AND the file with the function definitions if you do this.
%GrainSizeDistribution()

