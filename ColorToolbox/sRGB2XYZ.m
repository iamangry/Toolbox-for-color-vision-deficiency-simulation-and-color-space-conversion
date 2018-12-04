function XYZ = sRGB2XYZ(RGB)
%XYZ2SRGB Summary of this function goes here
%   Detailed explanation goes here
RGB = double(RGB <= 0.04045).*(RGB./12.92) + double(RGB > 0.04045).*(((RGB+0.055)./1.055).^2.4);
XYZ = (T_XYZ2Arbitrary([0.64 0.33 0.03],[0.3 0.6 0.1],[0.15 0.06 0.79],[95.047 100 108.883])\RGB')';
end

