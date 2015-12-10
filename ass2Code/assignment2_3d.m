badF = sum(d==0)
figure
% flip the data set so that the 0's are at the begining
% this will allow for better visualisation of 0s
plot(fliplr(J), '-', 'linewidth', 5);
D38_clean = D38(:, d~=0);
