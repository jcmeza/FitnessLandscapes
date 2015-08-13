function [ vertices, GRMeans, ABNames] = ReadMeans(MeansFile)
%
% Usage: [vertices, GRMeans, ABNames] = ReadMeans(MeansFile)
%
% Read the file containing the vertex information in degree lex order and
% the file containing the growth means for all antibiotics (in some order)
% IMPORTANT!!!
% Note that we are assuming that the csv file for the means has exactly 
% 15 antibiotics and we have 2^4 = 16 substitutions/genotypes/alleles
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
%   ReadABNames .... reads the antibiotic names from the growth rates file
%

%
% Default to MeanAll_50.csv if an input argument is not provided

if nargin < 1 
    MeansFile = 'MeanAll_T50.csv';
end

vertices = csvread('vertdeglex.csv');%


% IMPORTANT!!! Hard coded number of antibiotics to 15
% This should be changed so that it is computed from the input file
% Also note the actual data is stored after the first column and row

numab = 15;
numallele = 16;
GRMeans = csvread(MeansFile,1,1,[1 1 numab numallele]);

% the antibiotic names should be in the first column
ABNames = ReadABNames(MeansFile,2,numab+1);

end

