function [output] = varsFROMmu(MU,P,Tmax)
% calculates the consumption path (or path of any other variable for that
% matter) at a given tax rate and given draw of the parameter array
% Tax is chosen up to tmax, from when on full mitigation is assumed

% assumption here is of logarithmic utility and full depreciation (at a
% decadal time scale) yielding the closed form (constant) savings rate
% s=beta%gamma


%   PRELIMINARIES
    A=P.A;
    L=P.L/1000;
    para=P.para;
    sigma=P.sigma;
    th1 = P.th1;
    th2 = P.th2;
    %capital
    %   Capital
    K = zeros(60,12);
    K(1,:) = P.K0;
    %   temperatures
    T=zeros(60,2);
    T(1,:) = P.T0;
    T(2,:) = P.T1;
    %   Initial mass of carbon in the three reservoirs
    M=zeros(60,3);
    M(1,:) = P.M0;
    M(2,:) = P.M1;
    %   in carbon cycle and forcing: climate module
    EL = P.EL; %emissions due to land use change
    Fex = P.Fex; %Exogenous forcing
    TrM=P.TrM; xi=P.xi; TrT=P.TrT; psi=P.psi;

%savings rate
s1 = para(4)/(1+para(1))^10;
S = ones(60,12)*s1;
%the miitgation rate
sMU = size(MU);
mu = [zeros(1,12);ones(59,12)];
mu(2:(sMU(1)+1),:) = MU;
%abatement cost
lam = th1.*mu.^th2;
D(1,:) = damageRANDOM(T(1,1),psi);
AD(1,:) = (1-lam(1,:))./(1+D(1,:));
Q(1,:) = AD(1,:).*A(1,:).*L(1,:).^(1-para(4)).*K(1,:).^para(4);
K(2,:) = S(1,:).*Q(1,:)*10;
Y(2,:) = A(2,:).*L(2,:).^(1-para(4)).*K(2,:).^para(4);
E(2,:) = (1-mu(2,:)).*sigma(2,:).*Y(2,:);
M(3,:) = Mflow(M(2,:),sum(E(2,:) + EL(2,:)),TrM);
D(2,:) = damageRANDOM(T(2,1),psi);
AD(2,:) = (1-lam(2,:))./(1+D(2,:));
Q(2,:) = AD(2,:).*Y(2,:);
K(3,:) = S(2,:).*Q(2,:)*10;
for t=3:(Tmax-1)
    Y(t,:) = A(t,:).*L(t,:).^(1-para(4)).*K(t,:).^para(4);
    E(t,:) = (1-mu(t,:)).*sigma(t,:).*Y(t,:);  
    M(t+1,:) = Mflow(M(t,:),sum(E(t,:) + EL(t,:)),TrM);
    Mav = (M(t+1,1) + M(t,1))/2;
    T(t,:) = tempfor(Mav,Fex(t),xi,TrT,T(t-1,:));
    D(t,:) = damageRANDOM(T(t,1),psi);
    AD(t,:) = (1-lam(t,:))./(1+D(t,:));
    Q(t,:) = AD(t,:).*Y(t,:);
    K(t+1,:) = S(t,:).*Q(t,:)*10;
end
T(Tmax,:) = tempfor(M(Tmax,1),Fex(Tmax),xi,TrT,T(Tmax-1,:));
D(Tmax,:) = damageRANDOM(T(Tmax,1),psi);
AD(Tmax,:) = (1-lam(Tmax,:))./(1+D(Tmax,:));
Q(Tmax,:) = AD(Tmax,:).*A(Tmax,:).*L(Tmax,:).^(1-para(4)).*K(Tmax,:).^para(4);
c = (1-S(1:Tmax,:)).*Q(1:Tmax,:)./L(1:Tmax,:);
output = P;
output.c = c;
output.K = K;
output.Y = Y;
output.D = D;
output.T = T;
output.lam = lam;
output.mu = mu;
output.E = E;
output.M = M;