function C = Constants

    C.Gm = 3.98600435436E14;
    % [m^3/s^2]Gravitational parameter of the Earth.

    C.Re = 6378137;
    % [m]Mean equatorial radius of the Earth.

    C.we = 2 * pi / 86164.1;
    % [rad/s]Rotational speed of the Earth.

    C.g = 9.80665;
    % [m/s^2]Standard acceleration due to gravity.

    %-----------------------------------------------------------------------------------------------

    C.Lat = deg2rad(dms2degrees([25, 59, 29]));
    % [rad]Ground station latitude.

    C.Long = -deg2rad(dms2degrees([97, 11, 1]));
    % [rad]Ground station longitude.

    C.hgs = 0.9;
    % [m]Ground station altitude above mean equator.

    %-----------------------------------------------------------------------------------------------

    C.We = C.we * [0; cos(C.Lat); sin(C.Lat)];
    % [rad/s]Rotational velocity of the Earth in ENZ coordinates.

    C.Rgse = (C.Re + C.hgs) * [0; 0; 1];
    % [m]Ground station position WRT the Earth in ENZ coordinates.

    C.Vgse = cross(C.We,C.Rgse);
    % [m/s]Ground station velocity WRT the Earth in ENZ coordinates.

    C.Agse = cross(C.We,C.Vgse);
    % [m/s]Ground station velocity WRT the Earth in ENZ coordinates.

    %-----------------------------------------------------------------------------------------------

    C.rcg = 0.1205;
    % [m]Vehicle radius.

    C.acg = pi * C.rcg^2;
    % [m^2]Vehicle reference area.

    C.Cd = 0.5;
    % []Vehicle drag coefficient.

    C.mcg = 0.624;
    % [kg]Vehicle mass.

    %-----------------------------------------------------------------------------------------------

    C.Rcggs = 100 * [0; 0; 1];
    % [m]Initial vehicle position WRT the ground station in ENZ coordinates.

    C.Vcggs = zeros(3,1);
    % [m/s]Initial vehicle velocity WRT the ground station in ENZ coordinates.

    %-----------------------------------------------------------------------------------------------

    C.Options = odeset('RelTol',1E-10, 'Events', @(t, S)FreeFallEvent(t, S, C));
    % []Adusts the properties of the numerical integrator.

end
%===================================================================================================