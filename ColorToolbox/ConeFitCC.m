% Calculate the conversion matrix from CIERGB to LMS
load('optimizeOption.mat');
cmf = csvread('lin2012xyz2e_fine_7sf.csv'); % Color Matching Function (CMF)
cf = csvread('linss2_10e_fine.csv'); % Cone Fundamentals (Cone response)
rgb2lsm = zeros(3,3);
rgbcmf = XYZ2RGB(cmf(:,2:4)); % Compute CMF for RGB

% Optimize Process
CurMax = 10;
CurV = [0;0];
for i=1:200
    v0 = rand(2,1).*20;
    [v,CC] = fmincon(@(x)ConeFit(x,cf(:,2),rgbcmf),v0,[],[],[],[],[0;0],[Inf;Inf],[],options);
    if(CC<CurMax)
        disp([i,CC]);
        CurV = v;
        CurMax = CC;
    end
end
[~,ratio] = ConeFit(CurV,cf(:,2),rgbcmf);
rgb2lsm(1,:) = [CurV',1].*ratio;
CurMax = 10;
for i=1:200
    v0 = rand(2,1).*20;
    [v,CC] = fmincon(@(x)ConeFit(x,cf(:,3),rgbcmf),v0,[],[],[],[],[0;0],[Inf;Inf],[],options);
    if(CC<CurMax)
        disp([i,CC]);
        CurV = v;
        CurMax = CC;
    end
end
[~,ratio] = ConeFit(CurV,cf(:,3),rgbcmf);
rgb2lsm(2,:) = [CurV',1].*ratio;
CurMax = 10;
for i=1:200
    v0 = rand(2,1).*20;
    [v,CC] = fmincon(@(x)ConeFit(x,cf(:,4),rgbcmf),v0,[],[],[],[],[0;0],[Inf;Inf],[],options);
    if(CC<CurMax)
        disp([i,CC]);
        CurV = v;
        CurMax = CC;
    end
end
[~,ratio] = ConeFit(CurV,cf(:,4),rgbcmf);
rgb2lsm(3,:) = [CurV',1].*ratio;