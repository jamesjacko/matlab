% functions to generate data and labels
f = @() randn(400,2) * randi(6) - 3;
l = @(a) ones(400,1) + a;
Z = [f();f();f();f();f()];
labs = [l(-1); l(0); l(1); l(2); l(3)];
figure
hold on
% plot data ourlined
arrayfun(@(a) plot(Z(labs==a,1), Z(labs==a,2), '.', ...
    'color', rand(1,3), 'markersize', 20), 0:4)
