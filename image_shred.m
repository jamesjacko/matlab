% shreds an image based on a mod
function O = image_shred ( I, m )
    s = size(I)
    color = randi(255,3,1);
    if m < 1 || m > 3
        error('Mode can only be 1,2 or 3')
    else
        % if mode is three we run both
        % horizontal shred
        if m == 1 || m == 3
            splitter = randperm(s(1));
            splitter = splitter(1:floor(end/4));
            I(splitter, :, 1) = color(1);
            I(splitter, :, 2) = color(2);
            I(splitter, :, 3) = color(3);
        end
        % vertical shred
        if m == 2 || m == 3
            splitter = randperm(s(2));
            splitter = splitter(1:floor(end/4));
            I(:, splitter, 1) = color(1);
            I(:, splitter, 2) = color(2);
            I(:, splitter, 3) = color(3);
        end
    end
    O = uint8(I);
end

