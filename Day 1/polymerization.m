L = zeros(1000,1);
L(1)=10; 
t=zeros(1000,1);
t(1) = 1;
kon=5;
koff=1;
dt=1/500;
pon=kon*dt;
poff=koff*dt;


for i= 2:1000

    r = rand();
    t(i) = i;
    L(i)=L(i-1);
    if r<poff
        L(i)=L(i-1)-1; 
    end   
    s = rand();
    if s<pon    
        
        L(i)=L(i-1)+1;   
    end

    if L(i) < 0
        L(i) = 0;
    end

end
figure
plot(t,L)

