function Lab = XYZ2Lab(XYZ,White)
%XYZ2LAB Summary of this function goes here
%   Detailed explanation goes here
eps = 216/24389;
k = 24389/27;
r_xyz = XYZ./White;
f_xyz = (r_xyz.^(1/3)).*double(r_xyz>eps) + double(r_xyz<=eps).*(k.*r_xyz+16)./116;
Lab = [116*f_xyz(2)-16, 500*(f_xyz(1)-f_xyz(2)), 200*(f_xyz(2)-f_xyz(3))];
end

