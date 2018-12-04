% Calculate LMS conversion for three types of dichromacy
% Run after the ConeFitCC.m
% After running, copy the conversion matrix result into dichromatic.m
neu = rgb2lsm*[1;1;1];
e475 = rgb2lsm*XYZ2RGB(Spectrum2XYZ(475,1).*100)';
e485 = rgb2lsm*XYZ2RGB(Spectrum2XYZ(485,1).*100)';
e575 = rgb2lsm*XYZ2RGB(Spectrum2XYZ(575,1).*100)';
e660 = rgb2lsm*XYZ2RGB(Spectrum2XYZ(660,1).*100)';

p1 = [neu,e475]';
p2 = [neu,e575]';
t1 = [neu,e485]';
t2 = [neu,e660]';
lms2lmsp1 = [0 (inv(p1(:,[2 3]))*p1(:,1))';0 1 0;0 0 1];
lms2lmsp2 = [0 (inv(p2(:,[2 3]))*p2(:,1))';0 1 0;0 0 1];
d1 = inv(p1(:,[1 3]))*p1(:,2);
d2 = inv(p2(:,[1 3]))*p2(:,2);
lms2lmsd1 = [1 0 0;d1(1) 0 d1(2);0 0 1];
lms2lmsd2 = [1 0 0;d2(1) 0 d2(2);0 0 1];
lms2lmst1 = [1 0 0;0 1 0;(inv(t1(:,[1 2]))*t1(:,3))' 0];
lms2lmst2 = [1 0 0;0 1 0;(inv(t2(:,[1 2]))*t2(:,3))' 0];