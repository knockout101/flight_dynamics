tic;
% [s] starts the program timer

clc;
% [] clear the command window

clear;
% [] clear the variable workspace

format('Compact');
% [] Formats the command window output to single-spaced output
% Default is double space ('Loose')

format('LongG');
% [] Formats the command window output to display 16 digits for
% double-precision variables.

close('All');
% [] closes all windows

%% Numerical Integration

to = [0, 10];
% [s] modeling time

So = [1; 0];
% [m, m/s] Initial state

Options = odeset('RelTol', 1E-10);
% [] increases the accuracy of the numerical integrator.

S = ode45(@SpringMassEom, to, So, Options)
% [s,m,m/s] Numerically integrates the spring-mass system

%% Plot the Results:

t = S.x;
% [s] time vector

x = S.y(1,:);
% [m] Displacement vector - y comes in a vector only taking displacements

%% Plot Results

SpringMassPlot(t, x);
% [] Plots the spring-mass system results

%% Print the Simulation Time:

SimulationTime = toc;
% [s] Stops program timer.

SimulationTimeString = 'Simulation Complete! (%0.3f seconds)\n';
% [] formatted string

fprintf(SimulationTimeString, SimulationTime);
% [] prints the formatted string on the command window

