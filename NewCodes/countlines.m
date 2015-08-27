function [numlines] = countlines(filename)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% count lines

fid = fopen(filename,'rt');
a   = fread(fid,inf,'*char');
is  = a==char(13);
numlines = sum(is);
fclose(fid);

end

