function distribucion_empirica(sample, grado)
%% distribucion de probabilidad empírica de una muestra dada
% Algoritmo para obtener la distribución empírica de los datos
n = length(sample);
samplesrt = sort(sample);
prob = (1:n)/n;

p = [(samplesrt - (max(samplesrt) - min(samplesrt))) samplesrt (samplesrt + (max(samplesrt) - min(samplesrt)))];
q = [zeros(1,n) prob ones(1,n)];
A = [];

plot(p,q);

% construimos la matriz de Vandermonde que corresponde a la resolución del
% sistema polinomial de minimos cuadrados.
for i = grado:-1:0
    A = [A, (p.^i)'];
end

% para hacer mas estable el modelo le daremos una reestricción a la
% derivada 

q2 = 1:n;

for i = 1:n
    if i == 1
        q2(i) = 0;
    elseif i == n
        q2(i) = 0;
    else
        q2(i) = (q(i-1) - q(i+1))/(p(i-1) - p(i+1));
        q2(i)
    end
end

coef = (pinv(A'*A)*A'*(q'))';
% se tienen los coeficientes del polinomio por lo que ahora se ha de
% evaluar los valores del dominio de la función dados por p
plot(p,q)
hold on
plot(p, polyval(coef,p));
plot(p, polyval(polyder(coef),p));
hold off
end
