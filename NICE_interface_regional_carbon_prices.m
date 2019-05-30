%% This is the generic interface file for NICE maximising social welfare by means of a regional carbon prices
% after loading the data (line 3), the parameters novel to NICE can be chosen (lines 11 to 19), which are then added  to the model (lines 21 to 27),
% after which the optimisation parameters are chosen (lines 30 to 34), and finally the optimisation is performed in line 36
loadDATAforNICE
% set
rhov = [0.015];
etav = [1.5]; 
xiv = [1];
omegav = [1];
T7v = [0];
for i = 1 
    rho = rhov(i);
for j = 1
    eta = etav(j);
for k = 1
    omega = omegav(k);
for l = 1
    xi = xiv(l); 
for m = 1
    T7 = T7v(m);
% variables not being looped over     
    q = aggregateq;
    Lq = Lquintiles;
    tol = 0.1;
    d = damageelasticity(xi, q);
    z = damageelasticity(omega, q);
    Px = createP(certainPARAMETERS, dparam_SLR, T7);
    P = setP(Px,rho,eta,T7,q,xi,d,omega,z,Lq,tol);
%PARAMETERS CONTROLLING OPTIMISATION
    Tmax = 59;%number of periods (from 2005) the model runs (60 is max)
    dim = 20; %dimension of maximand (mitigation rate vector)
    init = ones(dim,12)*0.2;
    options = optimset('MaxFunEvals',100000,'Algorithm','interior-point','TolX',1e-8,'TolFun',1e-12,'MaxIter',10000); %various other options
%OPTIMISATION
    endo = optimiseNICEmitigation(P,init,Tmax,options);
    %endo.misc = {}; %put any additional information into this cell
    results(i,j,k,l,m) = endo;  
    [i j k l m]
    clear P;
end
end
end
end
end

%save('NICEdiffPrices.mat', 'results');