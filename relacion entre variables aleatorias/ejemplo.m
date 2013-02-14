% ejemplo de como descubrir la relacion no lineal entre variables
% aleatorias
k = 3; % grado del polinomio
n = 100;
X = normrnd(4,1,1,n);
Y = X.^k + normrnd(0,20,1,n); % funcion transformada con ruido considerable

% encontrar las funciones asociadas
Fx = [sort(X),(0:(length(X)-1))/(length(X)-1)];
Fy = [sort(Y),(0:(length(Y)-1))/(length(Y)-1)];

% econtrar la relacion entre las variables dada una función f
t = linspace(min(X),max(X),n);
a = interp1(sort(X),(0:(length(X)-1))/(length(X)-1),t);
f = interp1((0:(length(Y)-1))/(length(Y)-1),sort(Y),a);

plot(t,t.^k)
hold on;
plot(X,Y,'o')
plot(t,f)
hold off;

