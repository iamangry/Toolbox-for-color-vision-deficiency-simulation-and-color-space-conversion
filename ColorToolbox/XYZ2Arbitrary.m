function RGB = XYZ2Arbitrary(XYZ,RPrime,GPrime,BPrime,White,Gamma)
%XYZ2ARBITARAY Summary of this function goes here
%   Detailed explanation goes here

RGB = real(((T_XYZ2Arbitrary(RPrime,GPrime,BPrime,White) * XYZ')').^(1/Gamma));
end

