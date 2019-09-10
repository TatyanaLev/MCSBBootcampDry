z1=complex(rand)
c=complex(rand)

function 

end

save(juliaSet.mat)

%% 

load('juliaSet.mat');

juliaSet = nmax<22; % Julia set is defined as p values that mapped to infinity (here defined as abs(z)>2).

% plot black and white
f1=figure(1); clf; hold on; box on;
plot(real(p(juliaSet)), imag(p(juliaSet)), '.k');

% plot coloring according to exit number
figure(2); clf; hold on; box on;
scatter(real(p(juliaSet)), imag(p(juliaSet)), 10, nmax(juliaSet));
colormap(cool);

saveas(f1,'julia.png')

%% 

ntMax = 22;
a=(0+1i)*ones(1,ntMax);
b=(-1-1i)*ones(1,ntMax);
c=[a;b];
known_answer=c(1:ntMax+1);

% then we can compare the output of the program at these parameters

[~,zTrajectory]=followz(0+1i,0-1i);
disp('Output is')
disp(zTrajectory')

% to the known correct output as a test
if isequal(zTrajectory,known_answer)
    disp('test passed!')
else
    disp('test failed!')
end