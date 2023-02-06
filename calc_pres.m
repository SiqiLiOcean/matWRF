%==========================================================================
% matWRF package
%   Calculate pressure (Pa)
%
% input  :
%   P      --- pressure base          (Pa)
%   PB     --- pressure pertubation   (Pa)
%
% output :
%   pres   --- pressure               (Pa)
%
% Siqi Li, SMAST
% 2022-12-29
%
% Updates:
%
%==========================================================================
function pres = calc_pres(P, PB)

pres = P + PB;


