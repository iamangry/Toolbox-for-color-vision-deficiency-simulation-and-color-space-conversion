function XYZ = Arbitrary2XYZ(RGB,RPrime,GPrime,BPrime,White,Gamma)
%XYZ2ARBITARAY Summary of this function goes here
%   Detailed explanation goes here

XYZ = (T_XYZ2Arbitrary(RPrime,GPrime,BPrime,White)\real((RGB.^Gamma)'))';
end
