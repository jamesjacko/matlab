function w = perceptron(d,l,E)
    % Get max and min values for x for line drawing
    m = [min(d(:,1)) max(d(:,1))];
    figure, hold on, axis square
    axis([m(1) m(2) min(d(:,2)) max(d(:,2))])
    u = unique(l);
    % Color definition for actual labels could use rand(1,3)
    % but this sometimes gives similar colours
    c = [1 0 0; 0 1 0];
    % sizes of dataset
    [p, q] = size(d);
    % initialise weights randomly
    w = rand(q+1,1);
    while q*q'
        % loop over objects
        for i = 1:p
            % assign inputs to the perceptron including bias weight
            z = [1 d(i,:)];
            % Asign label, if the matrix multiplication between the 
            % current inputs and the weights is less than w
            % matrix multiplication allow us to multiply all inputs by
            % all weights in one operation
            v = z * w < 0;
            % when the asigned label is correct the current q will be 1
            q(i) = v==l(i);
            % adjust weights when necessary, an eta (learning rate) has
            % been introduced here
            w = w + q(i)*(2*v-1)*E*z';
            
           % using the max and min x calculate the current boundary
           y1 = -(w(1) + w(2) * m(1)) / w(3);
           y2 = -(w(1) + w(2) * m(2)) / w(3);
           y = [y1 y2];
           % plot the boundary
           plot(m,y,'k-');
           
        end
    end
    % plot final line y will still hold the values of the last line
    plot(m,y,'b-', 'linewidth', 3);
    % plot the original points
    for i = 1:numel(u)
        plot(d(l==u(i),1), d(l==u(i), 2), '.', 'markersize', ...
            30, 'color', c(i,:));
    end
end