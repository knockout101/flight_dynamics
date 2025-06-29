lsformat('LongG');

format('Compact');

ECI.R = [-8170904.97498379; 139309694.715178; 6038871.1038627];

ECI.V = [-29.2756707884103; -1.36482261166551; -0.591458705085465];

UTC = [2025, 6, 24, 17, 0, 0];

JD = juliandate(UTC);

Tu = JD - 2451545;

ERA = 2 * pi * (0.779057273264 + 1.00273781191135448 * Tu);
% [radians]

EciToEcef = [cos(ERA), sin(ERA), 0; -sin(ERA), cos(ERA), 0; 0, 0, 1];

ECEF.R = EciToEcef * ECI.R;

ECEF.V = EciToEcef * ECI.V;

rse = norm(ECEF.R);

phi = asin(ECEF.R(3) / rse);

phi = rad2deg(phi);

phi = degrees2dms(phi);
% [arcmin, arcseconds] converting from radians to arc moments

lamda = atan2(ECEF.R(2), ECEF.R(1));

lambda = -74;

GS.phi = [32, 43, 56.4];

GS.lambda = [97, 6, 48.2];

GS.lambda = -deg2rad(dms2degrees(GS.lambda));

GS.phi = deg2rad(dms2degrees(GS.phi));

EcefToEnz = [
    -sin(GS.lambda), cos(GS.lambda) , 0;
    -sin(GS.phi) * cos(GS.lambda), -sin(GS.phi) * sin(GS.lambda), cos(GS.phi);
    cos(GS.phi) * cos(GS.lambda), cos(GS.phi) * sin(GS.lambda), sin(GS.phi)
    ];

Re = 6378.137;
%[km]

hgs = 0.2;

ENZ.Rgse = (Re + hgs) * [0; 0; 1];

ENZ.We = 2* pi / 86164.1 * [0; cos(GS.phi); sin(GS.phi)];

ENZ.Vgse = cross(ENZ.We, ENZ.Egse);

ENZ.R = EcefToEnz * EFEF.R;

ENZ.V = EcefToEnz * EFEF.V;

ENZ.Rsgs = ENZ.R - ENZ.Rgse;

ENZ.Vsgs = ENZ.V - ENZ.Vgse - cross(ENZ.We, ENZ.Rsgs);

rsgs = norm(ENZ.Rsgs);

Azimuth = atan2d(ENZ.Rsgs(1), ENZ.Rsgs(2));

Elevation = asind(ENZ.Rsgs(3) / rsgs);