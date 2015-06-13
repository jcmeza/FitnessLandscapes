function [ vertices, gr_means, ab_names] = ReadMeans()
%ReadMeans()
%
% Read the files containing the vertex information in degree lex order and
% the file containing the growth means for all antibiotics (in same order)
% Note that we are assuming that the csv file for the means has exactly 
% 15 antibiotics and we have 2^4 = 16 substitutions

vertices = csvread('vertdeglex.csv');
gr_means = csvread('MeanAll_T50.csv',1,1,[1 1 15 16]);
ab_names = ReadABNames('MeanAll_T50.csv',2,16);

end

