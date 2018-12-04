function XYZ = xyY2XYZ(xyY)
%XYY2XYZ Summary of this function goes here
%   Detailed explanation goes here
if xyY(2)==0 || xyY(3)==0
    XYZ = [0 0 0];
else
    XYZ = xyY(3).*[xyY(1)/xyY(2),1,(1-xyY(1)-xyY(2))/xyY(2)];
end
end

