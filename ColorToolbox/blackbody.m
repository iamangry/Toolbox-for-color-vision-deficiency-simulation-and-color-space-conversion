function [wavelength,spectrum] = blackbody(temperature)
%BLACKBODY Summary of this function goes here
%   Detailed explanation goes here
wavelength = 360:830;
spectrum = 374145100000./((exp((14387000/temperature)./wavelength)-1).*pi.*((wavelength./1000).^5));
end

