%==========================================================================
% matWRF package
%   Calculate height (m)
%
% input  :
%   PH     --- perturbation geopotential    (m2/s2)
%   PHB    --- base-state geopotential      (m2/s2)
%
% output :
%   height --- height                       (m)
%
% Siqi Li, SMAST
% 2022-12-30
%
% Updates:
%
%==========================================================================
function height = calc_height(PH, PHB)

load_constants;

geopt = calc_geopt(PH, PHB);

height = geopt / G;