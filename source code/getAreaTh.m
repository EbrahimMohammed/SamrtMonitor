function [withinArea, volume] = getAreaTh (cropImg, p1)

%crop boundary
x1 = min (p1(:,2)) ; 
y1 = min (p1(:,1)) ;
x2 = max (p1(:,2)) ; 
y2 = max (p1(:,1)) ;

imgD = imcrop(cropImg, [x1, y1, (x2-x1), (y2-y1)]);
%crop target marker
xOri1 = 310;
width = 543 - 310;
yOri1 = 81;
height = 357 - 81;

%Calculate and compare target marker with white blocks boundary
bboxA = [x1, y1, (x2-x1), (y2-y1)];
bboxB = [xOri1, yOri1, width, height];
result= overlap_matrix(bboxA,bboxB);

%get intersept region
l = max(x1, xOri1);
r = min(x1+(x2-x1), x2+width);
b = max (y1, yOri1);
t = min(y1+(y2-y1), y2+height);
c3 = [l, b, r-l, t-b];
imgInter = imcrop(cropImg, c3);

%only segment waste if the intersept region is 20%
if result > 0.2
    [withinArea, volume] = gaborSeg(imgInter);

else
    withinArea = 0; volume = 0;
end