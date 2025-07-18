function SpringMassPendulumPlot(x, y)

    Window = figure(...
        'Color', 'w', ...
        'Name', 'Spring-Mass Pendulum System Analysis', ...
        'NumberTitle', 'off');
    % Initiates a new window and adjusts its properties

    XLim = 5 * [-1, 1];
    % [m] X-axis limit

    YLim = 5 * [-1, 1];
    % [m] Y-axis limit

    Axes = axes(...
        'FontName', 'Arial', ...
        'FontSize', 8, ...
        'FontWeight', 'Bold', ...
        'NextPlot', 'Add', ...
        'Parent', Window, ...
        'XGrid', 'On', ...
        'YGrid', 'On', ...
        'XLim', XLim, ...
        'YLim', YLim, ...
        'XTick', linspace(XLim(1), XLim(2), 21), ...
        'YTick', linspace(YLim(1), YLim(2), 21));
    % Adds axes to the specified window and adjusts its properties

    title(...
        'Spring-Mass Pendulum Simulation', ...
        'FontSize', 20, ...
        'Parent', Axes);
    % Adds a title to the specified axes and adjusts its properties

    xlabel('Horizontal Displacement (m)', ...
        'FontSize', 16, ...
        'Parent', Axes);
    % horizontal axis label

    ylabel('Vertical Displacement (m)', ...
        'FontSize', 16, ...
        'Parent', Axes);
    % vertical axis label

    plot(x, y, ...
        'Color', 'k', ...
        'LineStyle', 'None', ...
        'Marker', '.', ...
        'Parent', Axes);
    % plot formatting
end