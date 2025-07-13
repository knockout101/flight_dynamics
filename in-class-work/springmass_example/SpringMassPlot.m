function SpringMassPlot(t, x)

    Window = figure(...
        'Color', 'w', ...
        'Name', 'Spring-Mass System Analysis', ...
        'NumberTitle', 'Off');
    % [] Initiates a new window and adjusts its properties.
    % ... continues the line

    XLim = [0,10];
    % [s] X-axis limit

    YLim = 1.5 * [-1, 1];
    % [m] Y-axis limit

    Axes = axes(...
        'FontName', 'Arial', ...        % [] Sets the axes font name
        'FontSize', 12, ...             % [] Sets the axes font size
        'FontWeight', 'Bold', ...       % [] Sets the axes font weight
        'NextPlot', 'Add', ...          % [] New plots will not erase old ones.
        'Parent', Window, ...           % [] Specifies the window where the axes should be
        'XGrid', 'On', ...              % [] Turns the x-grid on
        'YGrid', 'On', ...              % [] Turns the y-grid on
        'XLim', XLim, ...               % [] Sets the limits of the x-axis
        'YLim', YLim, ...               % [] Sets the limits of the y-axis
        'XTick', linspace(XLim(1), XLim(2), 11), ...    % [] Sets the tick mark locations for X-axis
        'YTick', linspace(YLim(1), YLim(2), 11));    % [] Sets the tick mark locations for Y-axis
    % [] Adds an axes to the specified window and adjusts its properties

    title( ...
        'Spring-Mass Simulation', ...   % [] Sets the axes title string
        'FontSize', 20, ...             % [] Setst the title font size
        'Parent', Axes);                % [] Specifies the axes where the title should be
    % [] Adds a title to the specified axes and adjusts its properties

    xlabel('Time (s)', ...
        'FontSize', 16, ...
        'Parent', Axes);

    plot(t, x, ...
        'Color', 'k', ...
        'LineStyle', 'None', ...
        'Marker', '.', ...
        'Parent', Axes);
end