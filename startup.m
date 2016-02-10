addpath('external/genpath_exclude');
addpath(genpath_exclude('.',{'.svn'}))
try
startup_local
catch
warning('No startup_local.m found. Did you run ./configure?')
end
