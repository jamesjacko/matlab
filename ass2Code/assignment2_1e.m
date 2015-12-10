% get the step before the largest jump
% rerun function but get all steps back
[a, steps] = kruskals_mst_with_steps(z, 1)
% sort the differences between the critereon values (must assign a 0
% column to get the first difference of 0)
[d, i] = sort(diff( [0 steps(:,11)']));
% get the index of the largest jump with fewest clusters
S = i(end) - 1;

% get step array and Jump size
[x, J] = deal(steps(S,1:10), steps(S,11));
u = unique(x);
% use array fun to build a cell array of the values in the clusters
line = arrayfun(@(a) sprintf('%s', sprintf('%d ', index(x==a))), ...
    u, 'uniformoutput', 0);
% print the current step
fprintf('Suggested Clustering:\nStep %3i J = %3i, #Cl %3i: ( %s)\n',...
    S, J, numel(u) ,strjoin(line, ') ( '));
