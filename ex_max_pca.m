function Z = ex_max_pca(data, m)

d = size(data, 1);                                                % dimension of the data
mu = mean(data,2);                                           % mean of the data set
data = data - mu;                                               % subtract the mean from data
W = rand(d, m);                                                  % initialize weight parameters

thresh = 1e-5;
error = inf;
epoch = 400;
%%
% Implementation of the algorithm from paper
% EM Algorithms for PCA and SPCA by Sam Roweis
for ep = 1: epoch
    Z = (W'*W)\(W'*data);           
    W = (data*Z')/(Z*Z');          

    last = error;
    E = data-W*Z;
    error = mean(dot(E(:),E(:)));
    if  abs(last-error)<error*thresh 
        break; 
    end
end

