function Luv = XYZ2Luv(XYZ,White)
%XYZ2LAB Summary of this function goes here
%   Detailed explanation goes here
eps = 216/24389;
k = 24389/27;
yr = XYZ(2)/White(2);
uv = [4*XYZ(1) 9*XYZ(2)]./sum(XYZ.*[1 15 3]);
uv_ = [4*White(1) 9*White(2)]./sum(White.*[1 15 3]);
if yr>eps
    L = 116*(yr^(1/3))-16;
else
    L = k*yr;
end
Luv = [L (13*L).*(uv-uv_)];
end

