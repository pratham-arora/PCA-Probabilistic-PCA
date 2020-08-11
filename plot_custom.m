function plot_custom(data, label)

[d, n] = size(data);

if nargin == 1
    label1 = ones(n/2,1);
    label2 = label1 + label1;
    label = [label1; label2];                                 % For unlabelled data assign random label 
end

color = 'brgmcyk';
 m = length(color);
c = max(label);

figure(gcf);
clf;
hold on;
if d == 2
    view(2);
    for i = 1 : c
        idc = label==i;                                            % generate mask to get the value with particular label
        scatter(data(1,idc),  data(2,idc), 30, color(mod(i-1, m)+1));
    end
elseif d == 3
    view(3);
    for i = 1: c
        idc = label==i;
        scatter3(data(1,idc), data(2,idc), data(3,idc), 30, color(mod(i-1, m)+1));
    end
else
    error('You are pretty good at bad decisions');
end
axis equal
hold off