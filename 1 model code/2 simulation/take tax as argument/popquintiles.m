function Lq = popquintiles(L)
Lq = permute(repmat(L,1,1,5),[1 3 2])/5;
