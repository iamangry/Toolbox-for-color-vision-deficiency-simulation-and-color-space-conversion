function T = T_XYZ2Arbitrary(RPrime,GPrime,BPrime,White)
% Conversion matrix from XYZ to custom defined RGB space
Mr = [RPrime;GPrime;BPrime]';
Ma = inv(Mr);
W = Ma * White';
Ms = [1/W(1) 0 0;0 1/W(2) 0;0 0 1/W(3)];
T = Ms * Ma;
end

