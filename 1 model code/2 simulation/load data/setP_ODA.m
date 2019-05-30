function Pa = setP_ODA(P,rho,eta,T7,xi,q,Lq,tol,d,p,ODAtau,ODAregions)
Pa = P;
Pa.rho = rho;
Pa.eta = eta;
Pa.T7 = T7;
Pa.q = q;
Pa.exi = xi;
Pa.d = d;
Pa.omega = 1;
Pa.z = q;
Pa.Lq = Lq;
Pa.tol = tol;
Pa.p = p;
Pa.ODAtau = ODAtau;
Pa.ODAregions = ODAregions;