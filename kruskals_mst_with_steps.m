function [a, steps] = kruskals_mst_with_steps(b,c)
d = size(b,1);
e = nchoosek(1:d,2);
f = b(e(:,1),:) - b(e(:,2),:); 
[~,g] = sort(sum(f.*f,2)); 
e = e(g,:); 
% sort weights
f = sort(sum(f.*f,2));
% set the size of steps we will use the d+1 column to store the jump
steps = zeros(d, d+1);
a = 1:d;
i = 1;
% J will hold the jump length
J = 0;
p = 0;
while numel(unique(a)) > c 
 if a(e(1,1)) ~= a(e(1,2)) 
     steps(i, :) = [a J];
     a(a==a(e(1,1))) = a(e(1,2));
     J = sqrt(f(1,:).^2);
     i = i+1;
     f(1,:) = []; % remove the shortest distance after use
 end
 
 
 e(1,:) = []; % remove the shortest edge after use
end
steps(i+1, :) = [a J]; % last step
steps(all(steps==0,2),:)=[]; % remove rows of zeros
a = cmunique(a) + 1;