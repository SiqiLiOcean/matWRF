%==========================================================================
% matWRF package
%   constants
%
% input  :
% 
% output :
%
% Siqi Li, SMAST
% 2022-12-29
%
% Updates:
%
%==========================================================================
function load_constants

% Constants
ERRLEN              = 512;
ALGERR              = 64;
WRF_EARTH_RADIUS    = 6370000.;
T_BASE              = 300.0;            % WRF temperature base value
PI                  = pi;
RAD_PER_DEG         = PI/180.;
DEG_PER_RAD         = 180./PI;
P1000MB             = 100000.;          % 1000 mb
RD                  = 287.;             % Dry gas constant
RV                  = 461.6;
CP                  = 1004.5;           % Specific heat of dry air at constant pressure
G                   = 9.81;
USSALR              = 0.0065;  
CELKEL              = 273.15;
CELKEL_TRIPLE       = 273.16;
EZERO               = 6.112;
ESLCON1             = 17.67;
ESLCON2             = 29.65;
EPS                 = 0.622;
GAMMA               = RD/CP;
CPMD                = .887;
RGASMD              = .608;
GAMMAMD             = RGASMD - CPMD;
TLCLC1              = 2840.;
TLCLC2              = 3.5;
TLCLC3              = 4.805;
TLCLC4              = 55.;
THTECON1            = 3376.;
THTECON2            = 2.54;
THTECON3            = .81;
ABSCOEFI            = .272;             % Cloud ice absorption coefficient (m^2/g)
ABSCOEF             = .145;             % cloud water absorption coefficient (m^2/g)
GAMMA_SEVEN         = 720.;
RHOWAT              = 1000.;
RHO_R               = RHOWAT;
RHO_S               = 100.;
RHO_G               = 400.;
ALPHA               = 0.224;
SCLHT               = RD*256./G;
EXPON               =  RD*USSALR/G;
EXPONI              =  1./EXPON;
% % % DEFAULT_FILL        = 9.9692099683868690;
% % % DEFAULT_FILL_INT8   = -127;
% % % DEFAULT_FILL_INT16  = -32767;
% % % DEFAULT_FILL_INT32  = -2147483647;
% % % DEFAULT_FILL_INT64  = INT(-9223372036854775806D0, KIND=8);
% % % DEFAULT_FILL_FLOAT  = 9.9692099683868690E36;
% % % DEFAULT_FILL_DOUBLE = 9.9692099683868690;
% % % DEFAULT_FILL_CHAR   = ACHAR(0);


% Set 
S = whos;
for i = 1 : length(S)
    eval(['assignin(''caller'',''' S(i).name ''',' S(i).name ')']);
end

