function XYZ = RGB2XYZ(RGB)
%RGB2XYZ Summary of this function goes here
%   Detailed explanation goes here
XYZ = ([2.76888,1.75175,1.13016;1,4.5907,0.0601;0,0.05651,5.59427]*RGB')';
end

