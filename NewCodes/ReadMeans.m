function [ vertices, GRMeans, ABNames] = ReadMeans(MeansFile)
%ReadMeans()
%
% Read the files containing the vertex information in degree lex order and
% the file containing the growth means for all antibiotics (in same order)
% Note that we are assuming that the csv file for the means has exactly 
% 15 antibiotics and we have 2^4 = 16 substitutions
%
% Input
%   MeansFile ...... file containing the growth rate means in csv format
%
% Output
%   vertices........ vector containing order of the vertices (e.g. deglex)
%   GRMeans ........ matrix (15x16) containing the growth rate means for each antibiotic
%   ABNames ........ vector (15x1) containing the names of the antibiotic
%
% Function called
%   ReadABNames
%

if nargin < 1 
    MeansFile = 'MeanAll_T50.csv';
end

vertices = csvread('vertdeglex.csv');
GRMeans = csvread(MeansFile,1,1,[1 1 15 16]);
ABNames = ReadABNames(MeansFile,2,16);

end

