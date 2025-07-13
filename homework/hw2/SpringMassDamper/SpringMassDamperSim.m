%% Formatting and Program Timer
tic;
% Starting program timer

clc;
% clear the command window

format('Compact');
% formats the command window output to single-spaced output

format('LongG');
% formats the command window output to display 16 digit precision

close('All');
% closes all windows

%% Numerical Integration

to = [0, 10];
% [s] modeling time

So = [4.5; 1];
% [m, m/s] initial state

Options = odeset('RelTol', 1E-10);
% increases the accuracy of the numerical integrator.

S = ode45(@SpringMassDamperEoM, to, So, Options);
% [s, m, m/s] Numerically integrates the spring-mass system

%% Arrange the Results

t = S.x;
% [s] time vector

x = S.y(1,:);
% [m] Displacement vector - y comes in a vector only taking displacements
% (.y) term of S structure

%% Plot Results

SpringMassDamperPlot(t, x);
% Plots the spring-mass-damped system results

%% Print the Simulation Time
SimulationTime = toc;
% [s] stop program timer

SimulationTimeString = 'Simulation Complete! (%0.3f seconds)\n';
% formatted string

fprintf(SimulationTimeString, SimulationTime);
% prints the formatted string on the command window