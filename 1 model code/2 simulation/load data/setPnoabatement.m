function Pa = setPnoabatement(P,rho,eta,T7,xi,q,Lq,tol,d,p)
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