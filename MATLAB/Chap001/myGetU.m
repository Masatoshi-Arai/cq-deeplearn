% シグモイド関数の出力が0.8のuを求める
syms u;
eqn = 1/(1+exp(-u)) == 0.8;
sol = solve (eqn, u)
