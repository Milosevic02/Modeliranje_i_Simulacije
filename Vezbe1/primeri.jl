A = [1 4 -2 9 6; -1 0 0 3 7; 99 3 -3 4 7; 5 -6 0 -8 3; 1 2 3 4 5]

p = A[3]

p = A[3,1]

M = [0 0 0 0 0;
0 0 0 0 0;
1 0 0 0 0;
0 0 0 0 0;
0 0 0 0 0]

M_logical = convert.(Bool,M)

p = A[M_logical]

vrsta = A[1,:]

kolona = A[:,end]

nep_vrste = A[1:2:end,:]

poz_br = A[A .> 0]

opseg = A[(A .> -5) .& (A .< 5)]

max = maximum(A)

using LinearAlgebra

A_rev = reverse(A,dims = 2)

parni = A[rem.(A,2) .== 0]

suma_svake_vrste = sum(A,dims = 2)
maks = maximum(suma_svake_vrste)
vrste = findall(suma_svake_vrste .== maks)




