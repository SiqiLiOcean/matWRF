%==========================================================================
% matWRF package
%   Calculate relative humidity
%
% input  :
%   P      --- pressure base          (Pa)
%   PB     --- pressure pertubation   (Pa)
%   QVAPOR --- water vapor ratio      (1)
%   T      --- potential temperature  (K)
%
% output :
%   rh     --- relative humidity      (%, 0-100)
%
% Siqi Li, SMAST
% 2022-12-29
%
% Updates:
%
%==========================================================================
function rh = calc_rh(P, PB, QVAPOR, T)

load_constants;

pres = calc_pres(P, PB);
tk = calc_tk(P, PB, T);

es = EZERO * exp(ESLCON1* (tk-CELKEL) ./ (tk-ESLCON2));
qvs = EPS * es ./ (0.01*pres - (1-EPS)*es);

rh = 100 * max(min(QVAPOR./qvs, 1), 0);
