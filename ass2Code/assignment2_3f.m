% index for the top 8 features
ind = i(1: 8);
rE1 = 1 - mean(l == MyNMC(D38(:, ind), l, D38(:, ind)))
rE2 = 1 - mean(l == MyNMC(pc(:, 1:8), l, pc(:, 1:8)))
