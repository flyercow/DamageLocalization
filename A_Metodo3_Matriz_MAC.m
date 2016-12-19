%   Programa: A_Metodo3_Matriz_MAC    
%   Autor: Sergio Vigorra Treviño  
%-------------------------------------------------------------------------
%    Propósito: Programa para realizar el cálculo del MAC (Modal 
%               Assurance Criterion)
%      
%    Entradas: los parámetros de entrada son el modelo seleccionado, los 
%              vectores con las frecuencias naturales de cada estado, la
%              localización y el porcentaje de daño.
%    
%    Salidas: gráfico que muestra la matriz MAC correspondiente al cálculo
%             del estado no dañado con el dañado, y del no dañado con el
%             no dañado.
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
    [Freq2,Egv2]=A_Modelo4_VIga_voladizo_damage(localiz,damage);
end

if handles.modelo==5
    [Freq1,Egv1]=A_Modelo5_celosia;
    [Freq2,Egv2]=A_Modelo5_celosia_damage(localiz,damage);
end


%Cálculo del MAC

fi1=Egv1;   
fi2=Egv2;   
[m,n]=size(Egv1);

%Inclusion de ruido
if handles.radiobutton1==1
    snrlevel=20;                                   %DECIBELIOS
    for i=1:n
        fi1(:,i)=awgn(fi1(:,i),snrlevel);
        fi2(:,i)=awgn(fi2(:,i),snrlevel);
    end   
end


for i=1:m;
    for j=1:n;
    fi1n(i,j)=(fi1(i,j))/(norm(fi1(:,j)));
    fi2n(i,j)=(fi2(i,j))/(norm(fi1(:,j)));
    end
end

if handles.modelo==5
n=39;
end

for i=1:n;
    for j=1:n;
    MAC(i,j)=abs(((fi1n(:,i))'*(fi2n(:,j)))^2)/(((fi1n(:,i)')*...
        (fi1n(:,i)))*((fi2n(:,j)')*(fi2n(:,j))));
    end
end

for i=1:n;
    for j=1:n;
    MAC2(i,j)=abs(((fi1n(:,i))'*(fi1n(:,j)))^2)/(((fi1n(:,i)')*...
        (fi1n(:,i)))*((fi1n(:,j)')*(fi1n(:,j))));
    end
end

%Gráficas

x=[1:1:n];
y=x;

f=figure;
set(f,'Name','    Matriz MAC Estado dañado');
MACg=MAC(x,y);
pcolor(MACg);
colormap(cool(128));
caxis([0, 1]);

h=figure;
set(h,'Name','    Matriz MAC Estado no dañado');
MACg2=MAC2(x,y);
pcolor(MACg2);
colormap(cool(128));
caxis([0, 1]);
  
%--------------------------end--------------------------------------------
