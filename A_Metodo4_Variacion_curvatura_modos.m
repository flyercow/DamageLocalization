%   Programa: A_Metodo4_Variacion_curvatura_modos   
%   Autor: Sergio Vigorra Treviño  
%-------------------------------------------------------------------------
%    Propósito: Programa para implementar el método de diferencias en la 
%               curvatura de los modos. Mostrará la diferencia de la curva-
%               tura de los modos para los 3 primeros modos.
%
%    Entradas: los parámetros de entrada son el modelo seleccionado, los 
%              vectores con las frecuencias naturales de cada estado, la
%              localización y el porcentaje de daño.
%    
%    Salidas: gráficas que muestran las diferencias en la curvatura de los 
%             modos para los tres primeros modos de vibración.
%    
%--------------------------------------------------------------------------

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

    for modo=1:10
        j=1;
        for (i=2:3:m)
            Modo1(j,modo)=Egv1(i,modo);
            j=j+1;
        end    
    end

    for modo=1:10
        j=1;
        for (i=2:3:m)
            Modo2(j,modo)=Egv2(i,modo);
            j=j+1;
        end    
    end

end

if ((handles.modelo==5))

    for modo=1:10
        j=1;
        for (i=2:2:44)
            Modo1(j,modo)=Egv1(i,modo);
            j=j+1;
        end    
    end

    for modo=1:10
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
for i=1:10
        Modo1(:,i)=awgn(Modo1(:,i),snrlevel);
        Modo2(:,i)=awgn(Modo2(:,i),snrlevel);
    end   
end


%Cálculo de la curvatura de los modos

[o,p]=size(Modo1);

for modo=1:10
    for(i=2:(o-1))
        Modo1pp(i,modo)=((Modo1(i-1,modo)-2*Modo1(i,modo)+...
            Modo1(i+1,modo)))/(0.2^2);
        Modo2pp(i,modo)=((Modo2(i-1,modo)-2*Modo2(i,modo)+...
            Modo2(i+1,modo)))/(0.2^2);
    end
end


%Cálculo de la variación de la curvatura de los modos

for(i=2:(o-1))
    
    for modo=1:10 
 
        diff(i,modo)=abs(Modo2pp(i,modo)-Modo1pp(i,modo));
    
    end
end


%Gráficas

figure;
set(gcf,'Name','    Variación de la curvatura Modo 3 ');
bar(diff(:,3),'r');
axis([1 26 0 max(diff(:,3))]);
if handles.modelo==5
    axis([1 22 0 max(diff(:,3))]);
end

figure;
set(gcf,'Name','    Variación de la curvatura Modo 2 ');
bar(diff(:,2),'r');
axis([1 26 0 max(diff(:,2))]);
if handles.modelo==5
    axis([1 22 0 max(diff(:,2))]);
end

figure;
set(gcf,'Name','    Variación de la curvatura Modo 1 ');
bar(diff(:,1),'r');
axis([1 26 0 max(diff(:,1))]);
if handles.modelo==5
    axis([1 22 0 max(diff(:,1))]);
end

%--------------------------end--------------------------------------------
