% distribucion de probabilidad empírica de una muestra dada
n = 1000;
p = sort(normrnd(0,1,[1 n]));
q = (1:length(p))/length(p);

% se puede observar que se puede representar la distribución acumulada
plot(p,q);

% al encontrar la derivada de la distribucion acumulada
x = diff(p);
y = diff(q);
plot(p(1:(end-1)),y);