function [p,d,t] = dichromatic(sRGB)
% Conversion sRGB values into sRGB values for three dichromacy visions

% The following matrices are from computation in 
% ConeFitCC.m and calculatelms2lms.m
rgb2lsm = [1.438060073132116,4.291693936956442,0.067168175141071;0.022443728348121,4.678318389357008,0.039180655568801;0,0.029246546536545,2.891337198008478];
lms2lmsd1=[1,0,0;0.730423030711836,0,0.173163088674457;0,0,1];
lms2lmsd2=[1,0,0;0.756510489752865,0,0.121383381842332;0,0,1];
lms2lmsp1=[0,1.369069645881027,-0.237072328491203;0,1,0;0,0,1];
lms2lmsp2=[0,1.321858736323243,-0.160451683732747;0,1,0;0,0,1];
lms2lmst1=[1,0,0;0,1,0;-1.282099095466728,2.184164014192967,0];
lms2lmst2=[1,0,0;0,1,0;-0.022495619164324,0.643676357350158,0];

LMS = (rgb2lsm*XYZ2RGB(sRGB2XYZ(sRGB))')';
neu = rgb2lsm*[1;1;1];
p1 = XYZ2sRGB(RGB2XYZ((rgb2lsm\lms2lmsp1*LMS')'));
d1 = XYZ2sRGB(RGB2XYZ((rgb2lsm\lms2lmsd1*LMS')'));
t1 = XYZ2sRGB(RGB2XYZ((rgb2lsm\lms2lmst1*LMS')'));
p2 = XYZ2sRGB(RGB2XYZ((rgb2lsm\lms2lmsp2*LMS')'));
d2 = XYZ2sRGB(RGB2XYZ((rgb2lsm\lms2lmsd2*LMS')'));
t2 = XYZ2sRGB(RGB2XYZ((rgb2lsm\lms2lmst2*LMS')'));

SMQ = LMS(:,3)./LMS(:,2);
SLQ = LMS(:,3)./LMS(:,1);
MLQ = LMS(:,2)./LMS(:,1);
SME = neu(3)/neu(2);
SLE = neu(3)/neu(1);
MLE = neu(2)/neu(1);
p = repmat((SMQ<SME),1,3).*p2+repmat((SMQ>=SME),1,3).*p1;
d = repmat((SLQ<SLE),1,3).*d2+repmat((SLQ>=SLE),1,3).*d1;
t = repmat((MLQ<MLE),1,3).*t2+repmat((MLQ>=MLE),1,3).*t1;
end

