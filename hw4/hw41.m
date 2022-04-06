%load data
load("HW41.txt");
data=HW41;
%input
x1=data(:,1);
x2=data(:,2);
%output
y=data(:,3);
scatter3(x1,x2,y,'filled')

X = [ones(size(x1)) x1 x2 x1.*x2];
b = regress(y,X);

hold on
x1fit = min(x1):5:max(x1);
x2fit = min(x2):5:max(x2);
[X1FIT,X2FIT] = meshgrid(x1fit,x2fit);
YFIT = b(1) + b(2)*X1FIT + b(3)*X2FIT + b(4)*X1FIT.*X2FIT;

mesh(X1FIT,X2FIT,YFIT)
xlabel('Input1')
ylabel('Input2')
zlabel('Output')
view(50,10)
hold off