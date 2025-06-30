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
    dSdt(1) = S(2);

    dSdt(2) = L*k*S(1) / (m * sqrt(power(S(1), 2) + power(S(3), 2))) - c / m * S(2) - k / m * S(1) - g;

    dSdt(3) = S(4);

    dSdt(4) = L*k*S(3) / (m * sqrt(power(S(1), 2) + power(S(3), 2))) - c / m * S(4) - k / m * S(3) - g;

end