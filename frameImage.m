function O = frameImage(I)
% get the size of the cropped image
    sizer = size(I);
    sizer = sizer(1:2);
    % get the frame size 
    frameSize = round(min(sizer) * 0.2);
    % build canvas
    frame = ones(sizer + 2 * frameSize);
    % get a random colour
    color = randi(255,1,3)
    framedImage = cat(3, frame * color(1), frame * color(2), frame * color(3));
    % place image in the canvas
    framedImage(frameSize + 1:sizer(1) + frameSize, frameSize + 1 : sizer(2) ...
        + frameSize, 1) = I(:,:,1);
    framedImage(frameSize + 1:sizer(1) + frameSize, frameSize + 1 : sizer(2) ...
        + frameSize, 2) = I(:,:,2);
    framedImage(frameSize + 1:sizer(1) + frameSize, frameSize + 1 : sizer(2) ...
        + frameSize, 3) = I(:,:,3);
    framedImage = uint8(framedImage);
    O = framedImage;
end