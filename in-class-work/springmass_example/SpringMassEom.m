% minimum requirement is t and S
% Current time and current state
% could use a placeholder "~" for t to correct he warning
% this function being passed into ode45 is required to have at least the 2
% terms
function dSdt = SpringMassEom(~, S)

    k = 100;
    % [N/m] Spring Const

    m = 1;
    % [kg] Block mass

    dSdt = zeros(2,1);
    % [] allocates memory for the state vector derivative.

    dSdt(1) = S(2);
    % [m/s] Block speed

    dSdt(2) = -k/m * S(1);
    % [m/s] block accel
end