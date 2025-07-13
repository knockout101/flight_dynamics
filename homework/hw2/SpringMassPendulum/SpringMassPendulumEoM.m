function dSdt = SpringMassPendulumEoM(~, S)

    % Constants

    m = 1;
    % [kg] mass

    L = 2;
    % [m] Un-stretched length of the spring

    k = 100;
    % [N/m] spring constant

    c = 0.75;
    % [kg/s] damping coefficient

    g = 9.80665;
    % [m/s^2] acceleration due to gravity

    dSdt = zeros(4, 1);
    % Create the 4x1 matrix (vector)

    % assign each position its appropriate values 
    dSdt(1) = S(3);

    dSdt(2) = S(4);

    dSdt(3) = L*k*S(1) / (m * sqrt(power(S(1), 2) + power(S(2), 2))) - c / m * S(3) - k / m * S(1);

    dSdt(4) = L*k*S(2) / (m * sqrt(power(S(1), 2) + power(S(2), 2))) - (c / m) * S(4) - (k / m) * S(2) - g;

end