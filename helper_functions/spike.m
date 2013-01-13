% creates a spike image
% Thu Dec  6 11:41:44 2012
% NOTE: This function is from Lawrence Cormack

function s=spike(alpha, r, c)
%
% SPIKE -   creates a spike image, an array in which the
%           value is inversely proportional to the distance
%           from the center.
%
% usage:
%     S = SPIKE(ALPHA, R, C) produces an RxC array, the value
%                           of which falls off as 1/(d^ALPHA) where d is
%                           the euclidean distance from the array center.
%
%     Useful for making 1/f^alpha noise images.
%
% See also:  oneoverf(), spike3d(), oneoverf3d()
%
% Lawrence K. Cormack

% history:
% ??/??/2000    lkc     wrote it
% 11/12/2000    lkc     updated for any rxc size
% 11/12/2000    lkc     added odd/even dependent shift to compensate for the
%                       location of the DC after fftshift()
% 3/31/2002     lkc     added the exponent, alpha, to this function (where it belongs)
%                       rather than dealing with it in oneoverf()
% 4/1/2002      lkc     changed the distance computations to a more intuitive and
%                       straight-forward method using meshgrid().

if nargin == 2 c=r; end

s = ones(r, c);

y = linspace(-r./2, r./2, r);
x = linspace(-c./2, c./2, c);

[X, Y] = meshgrid(x, y);

dists = sqrt(X.^2 + Y.^2);
s = s./dists.^alpha;
