function dSdt = FreeFallEom(~,S,C)

    Rcggs = S(1:3);
    % [m]Vehicle position WRT the ground station in ENZ coordinates.

    Vcggs = S(4:6);
    % [m/s]Vehicle velocity WRT the ground station in ENZ coordinates.

    %-----------------------------------------------------------------------------------------------

    Rcge = C.Rgse + Rcggs;
    % [m]Vehicle position WRT the Earth in ENZ coordinates.

    Vcge = C.Vgse + cross(C.We,Rcggs) + Vcggs;
    % [m/s]Vehicle velocity WRT the Earth in ENZ coordinates.

    %-----------------------------------------------------------------------------------------------

    Vatm = cross(C.We,Rcge);
    % [m/s]Velocity of the atmosphere WRT the Earth in ENZ coordinates.

    Vinf = Vcge - Vatm;
    % [m/s]Vehicle true air velocity in ENZ coordinates.

    vinf = norm(Vinf);
    % [m/s]Vehicle true air speed.

    rcge = norm(Rcge);
    % [m]Vehicle range WRT the Earth.

    hcg = rcge - C.Re;
    % [m]Vehicle altitude above mean equator.

    [~,~,rho] = StandardAtmosphere(hcg);
    % [kg/m^3]Atmospheric density.

    Fd = -0.5 * C.Cd * rho * C.acg * vinf * Vinf;
    % [N]Drag force in ENZ coordinates.

    %-----------------------------------------------------------------------------------------------

    g = -C.Gm * Rcge / rcge^3;
    % [m/s^2]Acceleration due to gravity in ENZ coordinates.

    %-----------------------------------------------------------------------------------------------

    dSdt = zeros(6,1);
    % []Allocates memory for the state vector derivative.

    dSdt(1:3) = Vcggs;
    % [m/s]Vehicle velocity WRT the ground station in ENZ coordinates.

    dSdt(4:6) = Fd / C.mcg + g - C.Agse - cross(C.We,cross(C.We,Rcggs)) - 2 * cross(C.We,Vcggs);
    % [m/s^2]Vehicle acceleration WRT the ground station in ENZ coordinates.

end
%===================================================================================================