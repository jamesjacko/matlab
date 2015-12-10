close all
clear all
clc

figure, hold on, axis([0 1 0 1]), axis square, grid on
set(gca,'FontName','Candara','FontSize',14)
i = 0;
fin = 0;
tic
while toc < 20
    if ~waitforbuttonpress
        point = get(gca,'CurrentPoint');
            if(mod(i, 2) == 0)
                marker = 'o';
            else 
                marker = 's';
            end
            plot(point(1,1),point(1,2), '.', ...
                'MarkerFaceColor', rand(1,3), 'color', [0,0,0], ...
                'Marker', marker, 'MarkerSize', rand() * 35 + 5);
    else
        i = i + 1;
    end
end
