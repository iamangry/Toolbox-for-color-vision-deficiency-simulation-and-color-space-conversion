function xyY = XYZ2xyY(XYZ)
%XYY2XYZ Summary of this function goes here
%   Detailed explanation goes here
if sum(XYZ) == 0
    xyY(1:2) = 0;
else
    xyY(1:2) = XYZ(1:2)./sum(XYZ);
end
xyY(3) = XYZ(2);
end

