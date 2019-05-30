function W = equintileWelfareIT(c60,L60,rho,eta,T)

c = c60(2:T,:,:);
L = L60(2:T,:,:);
dis = 1/(1+rho);
R = bsxfun(@power,dis,10*(0:(T-2)));

% weightedC = sum(sum(L.*c,2),3); %extra lines for world aggregate
% Lbar = sum(sum(L,2),3);
% cbar = weightedC./Lbar;
% W = R*(Lbar.*cbar.^(1-eta)/(1-eta)); %extra lines for world aggregate
W = R*sum(sum(L.*(c.^(1-eta))/(1-eta),2),3); %NOT world aggregate
