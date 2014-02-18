% ejemplo de como descubrir la relacion no lineal entre variables
% aleatorias

n = 100;
X = linspace(-5,5,n);
Y = X.^3 - X.^2 + 1 + normrnd(0,25,1,n); % funcion transformada con ruido considerable

for j = 1:3
    
    if j~=1
        Y2 = interp1(f,sort(X),Y2);
    else
        Y2 = Y;
    end
    
    % encontrar las funciones asociadas
    Fx = [sort(X), (0:(length(X)-1))/(length(X)-1)];
    Fy = [sort(Y2), (0:(length(Y2)-1))/(length(Y2)-1)];
    
    % econtrar la relacion entre las variables dada una función f
    
    % cuidado: no se pueden repetir los valores en sort(X), o sea, se
    % requiere filtrar por el promedio
    u = sort(unique(X));
    u2 = zeros(size(u));
    
    k = (0:(length(X)-1))/(length(X)-1);
    
    for i = 1:length(u)
        u2(i) = mean(k(sort(X)==u(i)));
    end
    a = interp1(u, u2, X);
    
    v = sort(unique(Y2));
    v2 = zeros(size(v));
    
    k = (0:(length(Y2)-1))/(length(Y2)-1);
    for i = 1:length(v)
        v2(i) = mean(k(sort(Y2)==v(i)));
    end
    
    f = interp1(v2,v,a);
    
    % acumular la información de la función que relaciona las variables
    if j~=1
        f_acum=interp1(Y2,f,f_acum);
    else
        f_acum = f;
    end   
    plot(X,Y2)
end




% si la relacion entre las variables no es biyectiva se puede separar en
% conjuntos biyectivos.

