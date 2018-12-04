function RGB = XYZ2AdobeRGB(XYZ)
%XYZ2ADOBERGB Summary of this function goes here
%   Detailed explanation goes here
RGB = XYZ2Arbitrary(XYZ,[0.64 0.33 0.03],[0.21 0.71 0.08],[0.15 0.06 0.79],[95.047 100 108.883],2.2);
end

