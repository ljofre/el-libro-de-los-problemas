%% distribucion de probabilidad empírica de una muestra dada
% Algoritmo para obtener la distribución empírica de los datos
n = 100;
g = 10;
p = sort(normrnd(0,1,[1 n]))';
q = (1:length(p))/length(p)';

%% con esta información generamos un siste de ecuaciones para obtener el
% polinomio por minimos cuadrados, con esto el valor de 
%%
% 
% $$A \in \bf{R}$$
% 

A = [];
for i = [0:g]
    A = [A p.^i];
end

coef = inv(A'*A)*A'*q;

plot(p(1:(end-1)),y);