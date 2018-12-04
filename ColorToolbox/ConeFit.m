function [err,ratio] = ConeFit(x,fit,colormatching)
% Fit function to find the Cone response for 1 stimulii of RGB
c1 = colormatching*[x;1];
ratio = sum(fit)/sum(c1);
c1 = c1.*ratio;
err = sum((c1-fit).^2);
end

