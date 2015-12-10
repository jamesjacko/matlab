close all
clear all
clc

% 1 A
N = 10; % used throughout the script
% Generate distinct random points
r = randperm(25);
[x y] = ind2sub([5,5],r(1:N));
z = [x' y'];
figure
hold on
% have to increase marker size as it is 
plot(z(:,1), z(:,2), 'k.', 'markersize', 30);
text(z(:,1) + 0.1, z(:,2) + 0.1, num2cell(1:N));


% 1 B

% use repmat to create a matrix which contains the objects
% repeated in order 
% use repelem to create a matrix containing the objects repeated
% in groups
% calculate distances between the matrices
% reshape the resulting vector to form an NxN matrix
d=reshape(sum((repmat(z,N,1)'-repelem(z,N,1)').^2),N,N);

% 1 C
% Apply kruscals minimum spanning tree to the dataset and plot
% the clusters on the figure as coloured rings around the data
% values
a = kruskals_mst_with_comments(z, 3);
plot(z(a==1,1), z(a==1,2), 'ro', 'markersize', 10, 'linewidth', 10);
plot(z(a==2,1), z(a==2,2), 'go', 'markersize', 10, 'linewidth', 10);
plot(z(a==3,1), z(a==3,2), 'bo', 'markersize', 10, 'linewidth', 10);

% 1 D
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


% 1 E
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

%%
% 2 A
% functions to generate data and labels
f = @() randn(400,2) + randi(6) - 3;
l = @(a) ones(400,1) + a;
Z = [f();f();f();f();f()];
labs = [l(-1); l(0); l(1); l(2); l(3)];
figure
hold on
% plot data ourlined
arrayfun(@(a) plot(Z(labs==a,1), Z(labs==a,2), '.', ...
    'color', rand(1,3), 'markersize', 20), 0:4)
%%
% 2 B
figure
for i = 2:7
    c = kmeans_cg(Z, i);
    subplot(2, 3, i-1), hold on, axis square off;
    % Draw subplots
    arrayfun(@(a) plot(Z(c==a,1), Z(c==a,2), '.', ...
    'color', rand(1,3), 'markersize', 20), 1:i)
    title(i);
end

%%
% 3 A



% X = z;
% Y = z;
% D = bsxfun(@plus,dot(X,X,1)',dot(Y,Y,1))-2*(X'*Y);
% 
% 
% f = @(x, y) [randn(x,2) zeros(x,1) + y];
% 
% 
% c = [1 2 3 4 5 6 7; 9 8 7 6 5 4 3]';

% bsxfun(@(A,B) A - A, c, c)
% 
% e = arrayfun(@(a,b) bsxfun(@(a,b)b - a, a(1,:), a), c, c)

