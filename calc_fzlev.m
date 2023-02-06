%==========================================================================
% matWRF package
%   Calculate freezing altitude (m)
%
% input  :
%   P      --- pressure base              (Pa)
%   PB     --- pressure pertubation       (Pa)
%   PH     --- perturbation geopotential  (m2/s2)
%   PHB    --- base-state geopotential    (m2/s2)
%   T      --- potential temperature      (K)
%
% output :
%   FZLEV  --- freezing alititude         (m)
%
% Siqi Li, SMAST
% 2022-12-30
%
% Updates:
%
%==========================================================================
function fzlev = calc_fzlev(P, PB, PH, PHB, T)


load_constants;

height = calc_height(PH, PHB);
tk = calc_tk(P, PB, T);

nx = size(height, 1);
ny = size(height, 2);

fzlev = nan(nx, ny);

if_below_zero = tk<273.15;

% freeze at the surface
height_sfc = height(:,:,1);
fzlev(if_below_zero(:,:,1)) = height_sfc(if_below_zero(:,:,1));

% else
a = diff(if_below_zero, 1, 3);


