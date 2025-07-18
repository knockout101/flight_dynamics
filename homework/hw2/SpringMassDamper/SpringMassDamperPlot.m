function SpringMassDamperPlot(t, x)

   Window = figure(...
       'Color', 'w', ...
       'Name', 'Damped Spring-Mass System Analysis', ...
       'NumberTitle', 'off');
   % Initiates a new window and adjusts its properties.

   XLim = [0, 10];
   % [s] X-axis limit

   YLim = 5 * [-1, 1];
   % [m] Y-acis limit

   Axes = axes(...
       'FontName', 'Arial', ...
       'FontSize', 12, ...
       'FontWeight', 'Bold', ...
       'NextPlot', 'Add', ...
       'Parent', Window, ...
       'XGrid', 'On', ...
       'YGrid', 'On', ...
       'XLim', XLim, ...
       'YLim', YLim, ...
       'XTick', linspace(XLim(1), XLim(2), 11), ...
       'YTick', linspace(YLim(1), YLim(2), 11));
   % Adds an axes to the specified window and adjusts its properties

   title(...
       'Damped Spring-Mass Simulation', ...
       'FontSize', 20, ...
       'Parent', Axes);
   % Adds a title to the specified aces and adjusts its properties

   xlabel('Time (s)', ...
       'FontSize', 16, ...
       'Parent', Axes);

   plot(t, x, ...
       'Color', 'k', ...
       'LineStyle', 'None', ...
       'Marker', '.', ...
       'Parent', Axes);
end