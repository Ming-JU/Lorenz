% Neural network for prediction
xtmp = x0;
ynn(1,:) = x0;
for jj = 2:length(t)
    y0 = net(x0);
    ynn(jj,:) = y0.'; x0=y0;
end

plot3(ynn(:,1),ynn(:,2),ynn(:,3),':')
hold on;
[t,ytrue] = ode45(Lorenz,t,xtmp);
plot3(ytrue(:,1), ytrue(:,2), ytrue(:,3));