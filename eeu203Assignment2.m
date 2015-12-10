clear all
close all
clc

% Question 1
figure
hold on
% remove axis tick markers
set(gca,'xtick',[],'ytick',[])
axis equal on
% linearly interpolate from 0 to 1 for blue on RGB scale
a = linspace(0,1,40);
% we will be printing 40 diamonds
for i = 1:40
    
    % diamond coords
    x = [0 1 2 1];
    y = [1 0 1 2];
    % set up modifier vars for first horizontal left to right
    j = mod(i, 10);
    % special cas we need j to be 10 at this point not 0
    if(j == 0)
        j = 10;
    end
    k = 0;
    % first vertcal up
    if(i > 10 && i < 21)
        k = j;
        j = 10;
    % second horizontal right to left
    elseif(i > 20 && i < 31)
        k = 10;
        j = 10-j;
    % second vertical down
    elseif(i > 30)
        k = 10-j;
        j = 0;
    end
    
    
    % fill a polygon using modifier variables and interpolated colour
    fill(x + j,y + k, [0, 0, a(i)])
end
% 
% % Question 2
% 
% str = input('Type your message (letters and spaces only): ', 's');
% i = 1;
% % remove spaces from input
% str = str(str ~= ' ')
% while(i <= length(str))
%     disp(sprintf('%d : %s ---> %d\n', i+1, str(i), str(i)))
%     i = i + 1;
% end
% close all
% clear all
% clc
% % Question 3 a
% figure
% axis equal on
% set(gca,'xtick',[],'ytick',[])
% hold on
% line = [1,50; 1,35];
% for x = 1:50
%     for y = 1:50
%         if((line(1,2) - line(1,1))*(y - line(2,1)) - (line(2,2) - line(2,1))*(x - line(1,1)) > 0)
%             col = rand(1,3);
%         else
%             col = [0,0,0];
%         end
%         
%         if((x > 20 && x < 31) || (y > 20 && y < 31))
%             col2 = [0,0,0];
%         else
%             col2 = rand(1,3);
%         end
%         plot(x, y, 'k.','markers',10, 'Color', col)
%         plot(x+60, y, '.','markers',10,'Color',col2)
%     end
% end

% Question 3 b
% [x,y] = meshgrid(1:50);
% 
% def1 = (line(1,2) - line(1,1))*(y - line(2,1)) - (line(2,2) - line(2,1))*(x - line(1,1)) > 0;
% def2 = (x > 20 & x < 31) | (y > 20 & y < 31);
% x(~def1)
% plot(x(~def1), y(~def1), 'k.','markers',10)
% plot(x(def1), y(def1), '.','markers',10,'Color',rand(1,3))
% plot(x(def2)+60, y(def2), 'k.','markers',10)
% plot(x(~def2)+60, y(~def2), '.','markers',10,'Color',rand(1,3))