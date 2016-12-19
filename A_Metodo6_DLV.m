%   Programa: A_Metodo6_DLV    
%   Autor: Sergio Vigorra Treviño  
%-------------------------------------------------------------------------
%    Propósito: Implementar el método de los DLVs para detección de daño 
%               en una estructura.
%      
%    Entradas: los parámetros de entrada son el modelo seleccionado, los 
%              vectores con las frecuencias naturales de cada estado, la
%              localización y el porcentaje de daño. Además el programa 
%              hará uso de los modelos acabados en _DLV para realizar los
%              cálculos estáticos.
%    
%    Salidas: el programa realizará un gráfico de barras que mostrará el 
%             valor del índice nsi acumulado para todos los DLV en cada
%             elemento de la estructura.
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

[m,n]=size(Egv1);


%Filtrado de los modos para quedar solo con los movimientos verticales

if ((handles.modelo==1)||(handles.modelo==2)||(handles.modelo==3)||...
        (handles.modelo==4))

    for modo=1:n
        j=1;
        for i=2:3:m
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

size(Modo2)
%keyboard
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


%Diferencia matrices de flexibilidad y descomp. en valores singulares

Fdiff=(Fdanada-Fnodanada);
[U,S,V]=svd(Fdiff);

%Cálculo de los índices de tensión normalizada

sigmajmax=zeros(1,o);
sigmaj=zeros(o-1,o-1);

for i=1:o
    s(i)=S(i,i);
end

if handles.modelo==1

    for ndlv=1:o
        f=V(:,ndlv)';
        fuerzas=zeros(1,78); 
        j=1;
        for i=2:3:77
            fuerzas(1,i)=f(j);                                    
            j=j+1;
        end
        es=A_Modelo1_Viga_biempotrada_DLV(fuerzas');      
        for i=1:25
          sigmaj(ndlv,i)=(abs(es(1,3,i))+abs(es(2,3,i)))/2;                   
          if (sigmaj(ndlv,i)>sigmajmax(ndlv))
              sigmajmax(ndlv)=sigmaj(ndlv,i);
          end
        end
    end
end

if handles.modelo==2

    for ndlv=1:o
        f=V(:,ndlv)';
        fuerzas=zeros(1,78); 
        j=1;
        for i=2:3:77
            fuerzas(1,i)=f(j);                                    
            j=j+1;
        end
        es=A_Modelo2_Viga_biapoyada_DLV(fuerzas');      
        for i=1:25
          sigmaj(ndlv,i)=(abs(es(1,3,i))+abs(es(2,3,i)))/2;                   
          if (sigmaj(ndlv,i)>sigmajmax(ndlv))
              sigmajmax(ndlv)=sigmaj(ndlv,i);
          end
        end
    end
end

if handles.modelo==3

    for ndlv=1:o
        f=V(:,ndlv)';
        fuerzas=zeros(1,78); 
        j=1;
        for i=2:3:77
            fuerzas(1,i)=f(j);                                    
            j=j+1;
        end
        es=A_Modelo3_Viga_empotrada_apoyada_DLV(fuerzas');      
        for i=1:25
          sigmaj(ndlv,i)=(abs(es(1,3,i))+abs(es(2,3,i)))/2;                  
          if (sigmaj(ndlv,i)>sigmajmax(ndlv))
              sigmajmax(ndlv)=sigmaj(ndlv,i);
          end
        end
    end
end

if handles.modelo==4

    for ndlv=1:o
        f=V(:,ndlv)';
        fuerzas=zeros(1,78); 
        j=1;
        for i=2:3:77
            fuerzas(1,i)=f(j);                                    
            j=j+1;
        end
        es=A_Modelo4_Viga_voladizo_DLV(fuerzas');      
        for i=1:25
          sigmaj(ndlv,i)=(abs(es(1,3,i))+abs(es(2,3,i)))/2;              
          if (sigmaj(ndlv,i)>sigmajmax(ndlv))
              sigmajmax(ndlv)=sigmaj(ndlv,i);
          end
        end
    end
end

if handles.modelo==5

    for ndlv=2:o
        f=V(:,ndlv)';
        fuerzas=zeros(1,44); 
        j=1;
        for i=2:2:44
            fuerzas(1,i)=f(j);                                    
            j=j+1;
        end
        
        es=A_Modelo5_celosia_DLV(fuerzas');      
        for i=1:44
          sigmaj(ndlv,i)=es(i);                     
          if (sigmaj(ndlv,i)>sigmajmax(ndlv))
              sigmajmax(ndlv)=sigmaj(ndlv,i);
          end
        end
    end
end


%Cálculo de los valores singulares normalizados en los modelos viga, 
%selección de DLVs y cálculo de los índices de tensión normalizada para 
%los DLV seleccionados. Gráficas.

if ((handles.modelo==1)||(handles.modelo==2)||(handles.modelo==3)||...
        (handles.modelo==4))

nsi=zeros(26,25);

for ndlv=1:26
    nsi(ndlv,:)=sigmaj(ndlv,:)/sigmajmax(ndlv);
end

for ndlv=1:26
lv(ndlv)=s(ndlv)/ (V(:,ndlv)' * Fnodanada * V(:,ndlv));
end

validDLV=zeros(1,26);


%Information from multiple DLVs

for ndlv=1:26
    if lv(ndlv)<0.09
        validDLV(ndlv)=1;
    end
end

nsicombined=zeros(1,25);

for(ndlv=1:26)
    if validDLV(ndlv)==1
        nsicombined=nsicombined+nsi(ndlv,:);
    end
end

figure;
set(gcf,'Name','    DLVs');
nsicombined=nsicombined/max(nsicombined);
bar(nsicombined);
axis([0 26 0 1]);
xlabel('Elemento','interpreter','latex','fontsize',15,'fontname',...
    'times new roman');

end


%Cálculo de los valores singulares normalizados en los modelos celosía, 
%selección de DLVs y cálculo de los índices de tensión normalizada para 
%los DLV seleccionados. Gráficas.

if ((handles.modelo==5))
 
nsi=zeros(22,44);
 
for ndlv=1:22
     nsi(ndlv,:)=sigmaj(ndlv,:)/sigmajmax(ndlv);
end

nsi=nsi';
nsi(:,1)=[];
nsi(:,end)=[];
nsi=nsi';

[rows,columns]=size(nsi);

for ndlv=1:rows
    lv(ndlv)=s(ndlv)/ (V(:,ndlv)' * Fnodanada * V(:,ndlv));
end

validDLV=zeros(1,rows);

 for ndlv=1:rows
      if lv(ndlv)<0.09
          validDLV(ndlv)=1;
      end
 end
 
nsicombined=zeros(1,44);
 
for(ndlv=1:rows)
    if validDLV(ndlv)==1
        nsicombined=nsicombined+nsi(ndlv,:);
    end
end
 
figure;
set(gcf,'Name','    DLVs');
nsicombined=nsicombined/max(nsicombined);
bar(nsicombined);
 
axis([0 45 0 1]);
xlabel('Element','interpreter','latex','fontsize',15,'fontname',...
    'times new roman')
end

%--------------------------end--------------------------------------------
