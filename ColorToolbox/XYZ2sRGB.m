function RGB = XYZ2sRGB(XYZ)
%XYZ2SRGB Summary of this function goes here
%   Detailed explanation goes here
RGB = ((T_XYZ2Arbitrary([0.64 0.33 0.03],[0.3 0.6 0.1],[0.15 0.06 0.79],[95.047 100 108.883]) * XYZ')');

RGB = double(RGB <= 0.0031308).*(12.92.*RGB) + double(RGB > 0.0031308).*(1.055.*(RGB.^(1/2.4)) - 0.055);
end

