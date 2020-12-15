function area = CalculateArea (bw2)

S = regionprops(bw2, 'Area');
c = struct2cell(S);
d = cell2mat(c);
H = d';
area = sum (H);