function RGB = XYZ2RGB(XYZ)
%XYZ2RGB Summary of this function goes here
%   Detailed explanation goes here
RGB = ([0.41846,-0.1586,-0.08283;-0.09117,0.25243,0.01571;0.00092,-0.00255,0.1786]*XYZ')';
end

