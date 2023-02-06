%==========================================================================
% matWRF package
%   Calculate cloud fraction (1)
%
% input  :
%   P      --- pressure base          (Pa)
%   PB     --- pressure pertubation   (Pa)
%   QVAPOR --- water vapor ratio      (1)
%   T      --- potential temperature  (K)
%
% output :
%   lowc   --- low cloud fraction     (1)
%   midc   --- mid cloud fraction     (1)
%   highc  --- high cloud fraction    (1)
%
% Siqi Li, SMAST
% 2022-12-29
%
% Updates:
%
%==========================================================================
function [lowc, midc, highc] = calc_cloudfrac(P, PB, QVAPOR, T, varargin)

varargin = read_varargin(varargin, {'Low_Cloud'}, {97000});
varargin = read_varargin(varargin, {'Mid_Cloud'}, {80000});
varargin = read_varargin(varargin, {'High_Cloud'}, {45000});


pres = calc_pres(P, PB);
rh = calc_rh(P, PB, QVAPOR, T);

% Low cloud
rh_low = rh;
rh_low(pres>Low_Cloud | pres<=Mid_Cloud) = nan;
lowc = max(rh_low, [], 3);
lowc(isnan(lowc)) = 0;
lowc = 4*lowc/100 - 3;
lowc = max(min(lowc, 1), 0);
% Mid cloud
rh_mid = rh;
rh_mid(pres>Mid_Cloud | pres<=High_Cloud) = nan;
midc = max(rh_mid, [], 3);
midc(isnan(midc)) = 0;
midc = max(min(midc, 1), 0);
% High cloud
rh_high = rh;
rh_high(pres>High_Cloud) = nan;
highc = max(rh_high, [], 3);
highc(isnan(highc)) = 0;
highc = max(min(highc, 1), 0);

