function labels = MLP221(weights, Z)
o=ones(size(Z,1),1);
labels=[o [o Z]*weights(:,1)>=0 [o Z]*weights(:,2)>=0] * weights(:,3) >= 0;
end