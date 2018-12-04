function [pimg,dimg,timg] = dichromaticImage(img)
% Convert rgb color image into dichromacy vision
switch(class(img))
    case 'uint8'
        bitdepth = 8;
    case 'uint16'
        bitdepth = 16;
    case 'uint32'
        bitdepth = 32;
    otherwise
        error('only support 8,16,32 bits image');
end

img = double(img)./(2^bitdepth);
[a,b,~] = size(img);
sRGB = zeros(a*b,3);
sRGB(:,1) = reshape(squeeze(img(:,:,1)),1,[])';
sRGB(:,2) = reshape(squeeze(img(:,:,2)),1,[])';
sRGB(:,3) = reshape(squeeze(img(:,:,3)),1,[])';
[p,d,t] = dichromatic(sRGB);
[pimg,dimg,timg] = deal(img);
pimg(:,:,1) = reshape(p(:,1),a,b);
pimg(:,:,2) = reshape(p(:,2),a,b);
pimg(:,:,3) = reshape(p(:,3),a,b);
dimg(:,:,1) = reshape(d(:,1),a,b);
dimg(:,:,2) = reshape(d(:,2),a,b);
dimg(:,:,3) = reshape(d(:,3),a,b);
timg(:,:,1) = reshape(t(:,1),a,b);
timg(:,:,2) = reshape(t(:,2),a,b);
timg(:,:,3) = reshape(t(:,3),a,b);
if bitdepth == 8
    pimg = uint8(pimg.*256);
    dimg = uint8(dimg.*256);
    timg = uint8(timg.*256);
elseif bitdepth == 16
    pimg = uint16(pimg.*65536);
    dimg = uint16(dimg.*65536);
    timg = uint16(timg.*65536);
elseif bitdepth == 32
    pimg = uint16(pimg.*(2^32));
    dimg = uint16(dimg.*(2^32));
    timg = uint16(timg.*(2^32));
end

