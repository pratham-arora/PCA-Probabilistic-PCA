data = readmatrix('mnist_test.csv');
label = data(:,1);                                               
data_set = data(:, 2:end);      
[n, dim] = size(data_set);

%matrix is read from the mnist data set.
%The first column is class label.
%Rest of the columns are our data_set.

[N, d] = size(data_set);
mu=mean(data_set,1);
r_dim = 2;
%r_dim is the reduced dimension taken as 2.

S=1/N*(data_set-mu)'*(data_set-mu);
%S is the sample covariance matrix of the observations.
[W, sigma] = ppca_custom(S, r_dim);
   
I = eye(r_dim);
M = W'*W + sigma^2 * I;

mu = mean(data_set,1);
T_final = bsxfun(@minus, data_set, mu);
X = M\(W' * T_final');
%________________________________________

plot_custom(X,label);
