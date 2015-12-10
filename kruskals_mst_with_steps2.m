function [a, steps] = kruskals_mst_with_steps2(b,c)
d = size(b,1); % number of points
e = nchoosek(1:d,2); % array with all edges (d*(d-1)/2 rows, 2 columns)
f = b(e(:,1),:) - b(e(:,2),:); % differences between point
% coordinates (these will be 
% squared later to get the
% squared lengths)
[~,g] = sort(sum(f.*f,2)); % g is the index which will sort the
f = f(g,:);
sum(f.*f,2)
% edges from shortest to longest
e = e(g,:); % sorted edges according to length
a = 1:d; % forest with d trees (returned labels)
steps = cell(d,1);
s = 1;
nums= 1:d;
while numel(unique(a)) > c % check if the desired number of clusters
 
 % has been reached;
 % if not, go through the loop
 
 if a(e(1,1)) ~= a(e(1,2)) % if the vertices of the shortest
 % remaining edge are NOT in the same
 % cluster,
 
 
 a(a==a(e(1,1))) = a(e(1,2)); % relabel all vertices from
 % cluster A into cluster B
 % (This eliminates cluster A.)
 
 J(s) = e(1,1);
 str = '';
 for i = unique(a)
     str = strcat(str, '(');
     str = strcat(str, sprintf(' %d ', nums(a==i)), ' )');
 end
 steps(s) = {sprintf('Step %3i J = %3i, #Cl %3i: %s\n', s, J(s), ...
     numel(unique(a)), str)};
 
 s = s + 1;
 as(s,:) = cmunique(a) + 1;
 end
 e(1,:) = []; % remove the shortest edge after use
 f(1,:) = []; % remove the shortest edge after use
end
[~, i] = max(J);
disp(char(steps(1:i)));
a = cmunique(as(i,:)) + 1; % as the labels for the c clusters may be
% any integers between 1 and d, "squeeze"
% them to be consecutive numbers 1, 2, 3,..., c