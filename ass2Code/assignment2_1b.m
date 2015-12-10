% use repmat to create a matrix which contains the objects
% repeated in order
% use repelem to create a matrix containing the objects repeated
% in groups
% calculate distances between the matrices
% reshape the resulting vector to form an NxN matrix
d=reshape(sum((repmat(z,N,1)'-repelem(z,N,1)').^2),N,N);
