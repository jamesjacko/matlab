close all
clear all
clc
% Exam Question 1d

k = 25;
m = ones(k);
figure 
% axis of figure equal to k
axis([0 k 0 k]);
% select a random starting point
grazer = [randi(length(m(1,:))) randi(length(m(:,1)))];
while(sum(m(:) > 0))
    % set the current position of the grazer to 0
    m(grazer(2), grazer(1)) = 0;
    % reset the current figure this allows us to see the state at 
    % each itteration
    clf('reset')
    hold on
    % vizualize the matrix
    spy(m)
    % plot the grazer
    plot(grazer(1), grazer(2), 'rs');
    % set new coords for the grazer
    grazer = [grazer(1) + randi(3) - 2 grazer(2) + randi(3) - 2];
    % check to make sure the new coords ar inside the 0 to k bounds
    if(grazer(1) > k)
        grazer(1) = k;
    elseif(grazer(1) < 1)
        grazer(1) = 1;
    end
    if(grazer(2) > k)
        grazer(2) = k;
    elseif(grazer(2) < 1)
        grazer(2) = 1;
    end
    % pause to show working
    pause(0.03)
    % draw now will show the output at each itteration
    drawnow
end