%% Plot of our random coefficient

n = 2^10;
d = 6;

p = scramble(sobolset(d),"MatousekAffineOwen");
wpts = 2*net(p,n)-1;
xpts = (0:0.002:1)';
chebpoly = cos(acos(2*xpts-1)*(1:d))./((1:d).^2);

for beta = [0.6 0.8 0.9]
    amat = 1 + beta*chebpoly*wpts';
    plot(xpts,amat)
    xlabel('\(x\)')
    ylabel('\(a(x,\mathbf{W})\)')
    axis([0 1 -0.2 2.2])
    title(['\(\beta = ' num2str(beta) '\)'])
    print('-depsc',['axwbeta' num2str(beta) '.eps'])
end
