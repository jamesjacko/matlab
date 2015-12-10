% we are doing 1 dimensional distance so only need the absolute
% distance between the means
d = abs(mean(D38(l==3,:))-mean(D38(l==8,:)));
% sort in descending order
[J, i] = sort(d,'descend');
fprintf('Feature\t\tJ\n===\t\t===\n');
fprintf('%i\t\t%.2f \n', [i(1: 10)' J(1: 10)']' );
