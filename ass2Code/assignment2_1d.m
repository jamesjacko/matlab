% get the clusters and the steps from the new function
[a, steps] = kruskals_mst_with_steps(z, 3);
[N, n] = size(steps);
index = 1 : n - 1; % minus 1 as the last colomn is the Jump
% loop over the steps returned
for i = 1 : N
   % get step array and Jump size
   [x J] = deal(steps(i,1:10), steps(i,11));
   u = unique(x);
   % use array fun to build a cell array of the values in the clusters
   line = arrayfun(@(a) sprintf('%s', sprintf('%d ', index(x==a))), ...
       u, 'uniformoutput', 0);
   % print the current step
   fprintf('Step %3i J = %3i, #Cl %3i: ( %s)\n',...
       i, J, numel(u) ,strjoin(line, ') ( '));
end
