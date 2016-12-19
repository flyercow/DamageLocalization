%   Programa: A_Metodo5_Variacion_matriz_flexibilidad    
%   Autor: Sergio Vigorra Treviño  
%-------------------------------------------------------------------------
%    Propósito: Programa para implementar el método matriz de 
%               flexibilidad.
%      
%    Entradas: los parámetros de entrada son el modelo seleccionado, los 
%              vectores con las frecuencias naturales de cada estado, la
%              localización y el porcentaje de daño.
%    
%    Salidas: gráfica de barras que muestran los mayores valores de la 
%             diferencia entre la matriz del estado dañado y la matriz del
%             estado no dañado (en valor absoluto), para cada columna de 
%             dicha matriz.
%
%-------------------------------------------------------------------------

%Lectura de la localización del daño y el porcentaje de daño

localiz=handles.edit3;
damage=handles.slider2;


%Lectura de frecuencias y modos de vibración de los modelos

if handles.modelo==1
     [Freq1,Egv1]=A_Modelo1_Viga_biempotrada();
     [Freq2,Egv2]=A_Modelo1_Viga_biempotrada_damage(localiz,damage);
end

if handles.modelo==2
     [Freq1,Egv1]=A_Modelo2_Viga_biapoyada();
     [Freq2,Egv2]=A_Modelo2_Viga_biapoyada_damage(localiz,damage);
end

if handles.modelo==3
    [Freq1,Egv1]=A_Modelo3_Viga_empotrada_apoyada;
    [Freq2,Egv2]=A_Modelo3_Viga_empotrada_apoyada_damage(localiz,damage);
end

if handles.modelo==4
    [Freq1,Egv1]=A_Modelo4_Viga_voladizo;
    [Freq2,Egv2]=A_Modelo4_Viga_voladizo_damage(localiz,damage);
end

if handles.modelo==5
    [Freq1,Egv1]=A_Modelo5_celosia;
    [Freq2,Egv2]=A_Modelo5_celosia_damage(localiz,damage);
end


%Filtrado de los modos para quedar solo con los movimientos verticales

[m,n]=size(Egv1);

if ((handles.modelo==1)||(handles.modelo==2)||(handles.modelo==3)||...
        (handles.modelo==4))

    for modo=1:n
        j=1;
        for (i=2:3:m)
            Modo1(j,modo)=Egv1(i,modo);
            j=j+1;
        end    
    end

    for modo=1:n
        j=1;
        for (i=2:3:m)
            Modo2(j,modo)=Egv2(i,modo);
            j=j+1;
        end    
    end

end

if (handles.modelo==5)

    for modo=1:n
        j=1;
        for (i=2:2:44)
            Modo1(j,modo)=Egv1(i,modo);
            j=j+1;
        end    
    end

    for modo=1:n
        j=1;
        for (i=2:2:44)
            Modo2(j,modo)=Egv2(i,modo);
            j=j+1;
        end    
    end

end

%Inclusion de ruido
if handles.radiobutton1==1
    snrlevel=100;                                   %DECIBELIOS
for i=1:n
        Modo1(:,i)=awgn(Modo1(:,i),snrlevel);
        Modo2(:,i)=awgn(Modo2(:,i),snrlevel);
    end   
end

%Cálculo de las matrices de flexibilidad

f1=Freq1;
fi1=Egv1;
f2=Freq2;
fi2=Egv2;

[o,p]=size(Modo1);

Fnodanada=zeros(o);
for(i=1:1:p)
     Fnodanada=Fnodanada+(1/(f1(i,1)^2))*(Modo1(:,i))*(Modo1(:,i)');
end
 
Fdanada=zeros(o);
for(i=1:1:p)
     Fdanada=Fdanada+(1/(f2(i,1)^2))*(Modo2(:,i))*(Modo2(:,i)');
end


%Cálculo de la diferencia entre matrices de flexibilidad

Fdiff=abs(Fdanada-Fnodanada);
maximocolumna=zeros(o,1); 

for(i=1:o)
    for(j=1:o)
        if(Fdiff(i,j)>maximocolumna(j))
            maximocolumna(j)=Fdiff(i,j);
        end
    end
end


%Gráficas

figure;
%plot(maximocolumna);
bar(maximocolumna);
axis([0 27 0 max(maximocolumna)]);
if handles.modelo==5
    axis([0 23 0 max(maximocolumna)]);
end
ylabel('Variación matriz flexibilidad','interpreter','latex','fontsize',15,'fontname','times new roman');
xlabel('Node','interpreter','latex','fontsize',15,'fontname','times new roman');

%--------------------------end--------------------------------------------
