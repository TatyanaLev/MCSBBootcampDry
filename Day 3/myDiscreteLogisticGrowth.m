r = linspace(0.1,2.9,1000);
K = 0.6;
%x(1)
x0 = [0.2]; %, 0.5, 1, 1.5];
nMax=1000;
x(1)=x0;

figure; hold on;

for i=1:length(r)
    
        for n=1:nMax
            x(n+1) = x(n) + r(i) * ( 1- (x(n))/K) * x(n);
        end
        
        plot(r(i)*ones(1,501),x(500:1000),'.');
end

%plot(r,x(50:100);
ylabel('last 500 x');
xlabel('r');