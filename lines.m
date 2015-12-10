close all
clear all
clc

figure, hold on, axis([0 1 0 1]), axis square, grid on
set(gca,'FontName','Candara','FontSize',14)
i = 0;
center = 0;
while ~waitforbuttonpress
    point = get(gca,'CurrentPoint');
    if(i == 0)
        center = point;
    else
        plot([center(1,1), point(1,1)],[center(1,2), point(1,2)], '-', ...
            'color', rand(1,3), 'LineWidth', rand() * 2 + 1);
    end
    i = i + 1;
end
