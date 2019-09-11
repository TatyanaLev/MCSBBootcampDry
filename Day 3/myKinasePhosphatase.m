% set up initial conditionsP
kTot = 1;
pTot = 1; 
A0 = 0;
I0 = 1;
AP0 = 0;
IK0 = 0;

% set rates
kAon = 10;
kAoff = 10;
kIon = 10;
kIoff = 10;
kAcat = 10;
kIcat = 10;

% create differential equations

dAdt = @(A,AP,I,IK) -kAon*(pTot-AP)*A+kAoff*AP+kAcat*IK;
dAPdt = @(A,AP,I,IK) kAon*(pTot-AP)*A-kAoff*AP-kIcat*AP;

dIdt = @(A,AP,I,IK) -kIon*(kTot-IK)*I+kIoff*IK+kIcat*AP;
dIKdt = @(A,AP,I,IK) kIon*(kTot-IK)*I-kIoff*IK-kAcat*IK;

 
dxdt = @(t,x) [ dAdt(x(1),x(2),x(3),x(4));
         dAPdt(x(1),x(2),x(3),x(4));
         dIdt(x(1),x(2),x(3),x(4));
         dIKdt(x(1),x(2),x(3),x(4)) ];

% solve system
[T,X] = ode45(dxdt,[0,2],[A0,AP0,I0,IK0]);

%% plot
figure; clf; hold on; box on;
plot(T,X,'LineWidth',2);
plot(T,sum(X,2),'--k','LineWidth',2);

legend('A0', 'AP0', 'I0', 'IK0','sum');