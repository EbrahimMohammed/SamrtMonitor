
function p1 = lineBoundary (newImage)
I = newImage;
BW = rgb2gray (I); 

%get the white blocks to obtain their boundary
[B,L] = bwboundaries(BW,'noholes');

if numel (B) > 0
    
    for k = 1:length(B)
        boundary = B{k};
        p1 = boundary;
    end
else
    %if no white block, no boundary
    p1 = 0;
end


