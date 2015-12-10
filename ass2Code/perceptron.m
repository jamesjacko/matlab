function w = perceptron(d,l,epochs,E)
    m = [min(d(:,1)) max(d(:,1))];
    figure, hold on, axis square
    axis([m(1) m(2) min(d(:,2)) max(d(:,2))])
    u = unique(l);
    % Get sizes of dataset
    [p, q] = size(d);
    % initialise weights with small random numbers
    w = rand(q+1,1);
    errors = 1;
    count = 0;
    % infinite loop
    % while q*q'
    % could use rand(1,3) but similar colors make it hard to read
    c = [1 0 0; 0 1 0];
    while errors > 0 && count < epochs
        errors = 0;
        count = count + 1;
        % loop over objects
        for i = 1:p
            % get input for the perceptron including the bias
            z = [1 d(i,:)];
            % get output value which is the product of the inputs and 
            % the weights less than 0 (will return 1 or 0 (T or F))
            v = z * w < 0;
            % q(i) will be 1 or 0 depending on whether v is the same as l(i)
            q(i) = v==l(i);
            errors = ~q(i);
            if errors
               % adjust weights according to the formula
               w = w + ( 2 * v - 1 ) * E * z';
               y1 = -(w(1) + w(2) * m(1)) / w(3);
               y2 = -(w(1) + w(2) * m(2)) / w(3);
               y = [y1 y2];
               plot(m,y,'k-');
            end
            
        end
    end
    % plot points
    % find y's based on max and min x's
    y1 = -(w(1) + w(2) * m(1)) / w(3);
    y2 = -(w(1) + w(2) * m(2)) / w(3);
    y = [y1 y2];
    % plot the line
    plot(m,y,'b-', 'linewidth', 3);
    % plot final line
    for i = 1:numel(u)
        plot(d(l==u(i),1), d(l==u(i), 2), '.', 'markersize', ...
            30, 'color', c(i,:));
    end