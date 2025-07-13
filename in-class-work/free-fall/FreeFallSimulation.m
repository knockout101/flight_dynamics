tic;
% [s]Starts the program timer.

clc;
% []Clears the command window.

clear;
% []Clears the variable workspace.

format('Compact');
% []Formats the command window output to single-spaced output.

format('LongG');
% []Formats the command window output to display 16 digits for double-precision values.

close('All');
% []Closes all figures.

%% Load Simulation Parameters:

C = Constants;
% []Loads all of the simulation parameters.

%% Numerical Integration:

to = [0,10];
% [s]Modeling time.

So = [C.Rcggs, C.Vcggs];
% [m,m/s]Initial vehicle state WRT the ground station in ENZ coordinates.

S = ode45(@(t,S)FreeFallEom(t,S,C),to,So,C.Options);
% []Numerically integrates the equations of motion.

%% Plot Results:

t = S.x;
% [s]Time vector.

Rcggs = S.y(1:3,:);
% [m]Vehicle positions WRT the ground station in ENZ coordinates.

Vcggs = S.y(4:6,:);
% [m/s]Vehicle velocities WRT the ground station in ENZ coordinates.

PlotAltitude(t,Rcggs,C);
% []Plots the altitude above mean equator WRT to time.

%% Print Simulation Time:

SimulationTime = toc;
% [s]Stops the program timer.

SimulationTimeString = 'Simulation Complete! (%0.3f seconds)\n';
% []Formatted string.

fprintf(SimulationTimeString,SimulationTime);
% []Prints the simulation time on the command window.
%===================================================================================================