clc;
clear;
close all;
%% load dataset
a = readmatrix('mnist_test.csv');                      % read the file
label = a(:,1);                                                       % first coloumn is the label 
data = a(:, 2:end);
[n, dim] = size(data);
m = 2;                                                                 %  final dimension of the dataset
%% 2D plot visualization 
Z2 = ex_max_pca(data', m);                              % MNIST is 10000x784 which is n*d but the equation for EM step 
                                                                             % in the paper is written for dxn format do we passed data' to ppca
figure;
plot_custom(Z2,label);
%% 3D plot visualization 
m1 = 3;
Z3 = ex_max_pca(data', m1);
figure;
plot_custom(Z3, label);