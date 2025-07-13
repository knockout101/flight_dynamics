function [hcg, IsTerminal, Direction] = FreeFallEvent(~, S, C)

Rcggs = S(1:3);
% [m] Vehicle position WRT the ground station in ENZ coordinates.

Rcge = C.Rgse + Rcggs;
% [m] Vehicle positon WRT the Earth in ENZ coordinates

hcg = norm(Rcge) - C.Re;
% [m] Vehicle altitude above mean equator

IsTerminal = 1;
% [] Numerical integration stops as soon as the zero event is reached

Direction = 0;
% [] Checks zeros when the event is decreasing (1 for increasing and 0 for
% both)

end