function NewLabels = MyNMC(Ztr, Ytr, Zts)
    % Get a variable holding the unique labels
    labels = unique(Ytr);
    % grpstats gets mean grouped by the labels
    mean = grpstats(Ztr, Ytr);
    for i = 1 : size(Zts,1);
       % Assign label index by getting the smallest distance when comparing
       % the current element with the means
       [~, NewLabels(i)] = min(pdist2(mean, Zts(i,:)));
    end
    % Assign label values by indexing the unique labels with 
    % the supplied indeces
    NewLabels = labels(NewLabels);
end