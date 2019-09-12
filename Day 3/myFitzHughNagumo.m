% set parameters
a = 0.5;
b = 0.2;
eps = 0.08;


% model definition
f = @(v,w) v - 1/3*v.^3 - w;
g = @(v,w) eps *(v + a -b*w);

% single cell
dxdt =@ (t,x) [f(x(1),x(2)); g(x(1),x(2));];

% solve
[t,X] = ode15s(dxdt,[0,100], [-0,-0.5]);

% plot
figure; clf; hold on; box on;
plot(t,X(:,1),'b');
plot(t,X(:,2),'r');
