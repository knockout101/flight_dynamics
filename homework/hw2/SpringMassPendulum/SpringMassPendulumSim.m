%% Formmating

tic;
% Start program timer

clc;
% clear console

format('Compact');
% formats the command window output to single-spaced output

format('LongG');
% formats the command window output to display 16 digit precision

close('All');
% close all windows

%% Numerical Integration

to = [0, 10];
% [s] modeling time

So = [0;4;7;0];
% [m, m/s, m, m/s] initial state

Options = odeset("RelTol", 1E-10);
% Sets relative tolerance

S = ode45(@SpringMassPendulumEoM, to, So, Options);
% Create an S struct that is the current state of the model

%% Arrange the Results

x = S.y(1,:);

y = S.y(3,:);

%% Plot Results

SpringMassPendulumPlot(x, y);

%%

SimulationTime = toc;
% [s] stop program timer

SimulationTimeString = 'Simulation Complete! (%0.3f seconds)\n';
% formatted string

fprintf(SimulationTimeString, SimulationTime);
% prints the formatted string on the command window