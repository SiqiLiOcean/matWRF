%==========================================================================
% matWRF package
%   Calculate dew point (K)
%
% input  :
%   P      --- pressure base          (Pa)
%   PB     --- pressure pertubation   (Pa)
%   QVAPOR --- water vapor ratio      (1)
% 
% output :
%   td     --- dew point              (K)
% Siqi Li, SMAST
% 2022-12-30
%
% Updates:
%
%==========================================================================
function td = calc_td(P, PB, QVAPOR)

load_constants;

pres = calc_pres(P, PB);
qv = max(QVAPOR, 0);

tdc = qv .* pres/100 ./(EPS + qv);
tdc = max(tdc, 1e-3);   % avoid problems near zero

td = (243.5*log(tdc) - 440.8) ./ (19.48 - log(tdc));
