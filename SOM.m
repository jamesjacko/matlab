function W = SOM( Z, s, T, alpha, gamma )
    [N,n] = size(Z);
    Index = 1:prod(s);
    nm = reshape(Index, s(1), s(2));
    
    W = rand(prod(s), n) * 0.4;
    for i = 1:T
        Z = Z(randperm(N), :);
        for j = 1: N
           X = Z(j,:);
           [~, win  ] = min(sum((repmat(X, prod(s), 1) - W).^2,2));
           [r,c] = find(nm == win);
           nei = [];
           for k1 = r-1: r+1
               for k2 = c-1: c+1
                   if k1> 0 && k1 <= s(1) && k2 > 0 && k2 <= s(2) ...
                           && ~(k1 == 4 && k2 == c)
                       nei = [nei nm(k1, k2)];
                   end
               end
           end 
           W(win,:) = W(win,:) + alpha * (X - W(win,:));
           
           W(nei,:) = W(nei,:) + alpha^2 * ...
               (repmat(X, numel(nei),1) - W(nei,:));
           
           alpha = alpha * gamma;
        end
    end
    
end

