%   Programa: A_Metodo1_Variacion_frecuencias_naturales    
%   Autor: Sergio Vigorra Treviño  
%-------------------------------------------------------------------------
%    Propósito: El programa muestra las frecuencias naturales de los 
%               estados dañado y no dañado de la estructura, y la dife-
%               rencia porcentual entre éstas. 
%           
%    Entradas: los parámetros de entrada son el modelo seleccionado, los 
%              vectores con las frecuencias naturales de cada estado, la
%              localización y el porcentaje de daño.
%    
%    Salidas: datos mostrados en una tabla.
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


%Ensamblaje de la matriz dat2, que se mostrará en la tabla

dat=[Freq1,Freq2];

dat2=zeros(10,2);

for i=1:10
    for j=1:2
        dat2(i,j)=dat(i,j);
    end
end

for i=1:10
    dat2(i,3)=(abs(dat2(i,1)-dat2(i,2))/dat2(i,1))*100;
end


%Tabla

f = figure;
cnames = {'Non damaged state frequencies (hz)',...
          'Damaged state frequencies (hz)','Percentage difference (%)'};
rnames = {'1','2','3','4','5','6','7','8','9','10'};
t = uitable('Parent',f,'Data',dat2,'ColumnName',cnames,'RowName',rnames);
set (t, 'ColumnWidth', {250});
set(t,'Position',[0 213 787 207]); 
set(f,'Name','    Variación Frecuencias Naturales');

%--------------------------end--------------------------------------------
