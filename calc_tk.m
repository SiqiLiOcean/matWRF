%==========================================================================
% matWRF package
%   Calculate temperature (K)
%
% input  :
%   P      --- pressure base          (Pa)
%   PB     --- pressure pertubation   (Pa)
%   T      --- potential temperature  (K)
%
% output :
%   tk     --- temperature            (K)
%
% Siqi Li, SMAST
% yyyy-mm-dd
%
% Updates:
%
%==========================================================================
function tk = calc_tk(P, PB, T)

load_constants;

pres = calc_pres(P, PB);

theta = T + T_BASE;
tk = (pres / P1000MB).^(RD/CP) .* theta;
