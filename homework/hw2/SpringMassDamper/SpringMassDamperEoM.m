function dSdt = EquationOfMotion(~, S)

    % Constants

    c = 1.15;
    % [kg/s] damper coefficient
    k = 100;
    % [N/m] spring constant
    m = 1;
    % [kg] mass

    dSdt = zeros(2, 1);

    dSdt(1) = S(2);
    % first term of the change in State vector

    dSdt(2) = -(c/m) * S(2) - (k/m) * S(1);
    % second term of the change in State vector
end