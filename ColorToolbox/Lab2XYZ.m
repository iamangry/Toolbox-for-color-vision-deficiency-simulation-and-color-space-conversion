function XYZ = Lab2XYZ(Lab,White)
%XYZ2LAB Summary of this function goes here
%   Detailed explanation goes here
eps = 216/24389;
k = 24389/27;
fy = (Lab(1)+16)/116;
fx = Lab(2)/500 + fy;
fz = fy - Lab(3)/200;
if fx>eps
    xr = fx^3;
else
    xr = (116*fx-16)/k;
end
if fz>eps
    zr = fz^3;
else
    zr = (116*fz-16)/k;
end
if Lab(1)>k*eps
    yr = ((Lab(1)+16)/116)^3;
else
    yr = Lab(1)/k;
end
XYZ = [xr yr zr].*White;
end

