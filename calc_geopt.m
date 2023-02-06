%==========================================================================
% matWRF package
%   Calculate geopotential
%
% input  :
%   PH    --- perturbation geopotential    (m2/s2)
%   PHB   --- base-state geopotential      (m2/s2)
%
% output :
%   geopt --- geopotential                 (m2/s2)
%
% Siqi Li, SMAST
% 2022-12-30
%
% Updates:
%
%==========================================================================
function geopt = calc_geopt(PH, PHB)

geopt = PH + PHB;