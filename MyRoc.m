function [RocMatrix, Closest] = myRoc(data, labels)
[~,ind] = sort(data);
d = labels(ind);

RocMatrix = zeros(numel(d), 2);
    for i = 1:numel(d)
        % Get current position in the data (split)
        dstart = d(1:i);
        dend = d(i+1:end);
        % Find all the:
            % True Positives and Negatives and
            % False Positives and Negatives
        tPos = sum(dend == 2);
        tNeg = sum(dstart == 1);
        fPos = sum(dend == 1);
        fNeg = sum(dstart == 2);
        % Put the Sensitivity and specificity for each split
        % into the roc matrix in columns 1 and 2 respectively
        RocMatrix(i, 1) = tNeg/(tNeg+fPos);
        RocMatrix(i, 2) = tPos/(tPos+fNeg);
    end
    [~, ind] = min(pdist2([1 - RocMatrix(:,1) RocMatrix(:,2)], [0 1]));
    Closest = RocMatrix(ind,:);
end