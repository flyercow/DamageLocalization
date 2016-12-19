%   Programa: A_Metodo2_Variacion_modos    
%   Autor: Sergio Vigorra Treviño  
%-------------------------------------------------------------------------
%    Propósito: Este programa muestra y compara los diez primeros modos de
%               vibración de los estados dañado y no dañado del modelo. 
%      
%    Entradas: los parámetros de entrada son el modelo seleccionado, los 
%              vectores con las frecuencias naturales de cada estado, las
%              matrices con los modos de vibración, localización del daño
%              y porcentaje de daño.
%    
%    Salidas: representación gráfica de los modos.
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
    for modo=1:10
        j=1;
        for i=2:3:m
            Modo1(j,modo)=Egv1(i,modo);
            j=j+1;
        end    
    end

    for modo=1:10
        j=1;
        for i=2:3:m
            Modo2(j,modo)=Egv2(i,modo);
            j=j+1;
        end    
    end

end

if (handles.modelo==5)
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
    snrlevel=100;   %DECIBELIOS
    for i=1:10
        Modo1(:,i)=awgn(Modo1(:,i),snrlevel);
        Modo2(:,i)=awgn(Modo2(:,i),snrlevel);
    end
end


%Gráficas

modo=1;

if ((Modo1(8,modo)>0) && (Modo2(8,modo)<0)) || ((Modo1(8,modo)<0)...
&& (Modo2(8,modo)>0))
Modo2(:,modo)=-Modo2(:,modo);
end
figure;
plot(Modo1(:,modo),'k');
hold on;
plot(Modo2(:,modo),'r');
ylabel('Mode 1','interpreter','latex','fontsize',15,'fontname',...
    'times new roman')
xlabel('node','interpreter','latex','fontsize',15,'fontname',...
    'times new roman')
if (handles.modelo==1)||(handles.modelo==2)||(handles.modelo==3)||...
        (handles.modelo==4)
    axis([1 26 -1 1]);
end
if handles.modelo==5
    axis([1 22 min(Modo1(:,modo)) max(Modo1(:,modo))]);
end
axis tight

modo=2;

if ((Modo1(8,modo)>0) && (Modo2(8,modo)<0)) || ((Modo1(8,modo)<0)...
&& (Modo2(8,modo)>0))
Modo2(:,modo)=-Modo2(:,modo);
end
figure;
plot(Modo1(:,modo),'k');
hold on;
plot(Modo2(:,modo),'r');
ylabel('Mode 2','interpreter','latex','fontsize',15,'fontname',...
    'times new roman')
xlabel('node','interpreter','latex','fontsize',15,'fontname',...
    'times new roman')
if (handles.modelo==1)||(handles.modelo==2)||(handles.modelo==3)||...
        (handles.modelo==4)
    axis([1 26 -1 1]);
end
if handles.modelo==5
    axis([1 22 min(Modo1(:,modo)) max(Modo1(:,modo))]);
end
axis tight

modo=3;

if ((Modo1(8,modo)>0) && (Modo2(8,modo)<0)) || ((Modo1(8,modo)<0)...
&& (Modo2(8,modo)>0))
Modo2(:,modo)=-Modo2(:,modo);
end
figure;
plot(Modo1(:,modo),'k');
hold on;
plot(Modo2(:,modo),'r');
ylabel('Mode 3','interpreter','latex','fontsize',15,'fontname',...
    'times new roman')
xlabel('node','interpreter','latex','fontsize',15,'fontname',...
    'times new roman')
if (handles.modelo==1)||(handles.modelo==2)||(handles.modelo==3)||...
        (handles.modelo==4)
    axis([1 26 -1 1]);
end
if handles.modelo==5
    axis([1 22 min(Modo1(:,modo)) max(Modo1(:,modo))]);
end
axis tight

modo=4;

if ((Modo1(8,modo)>0) && (Modo2(8,modo)<0)) || ((Modo1(8,modo)<0)...
&& (Modo2(8,modo)>0))
Modo2(:,modo)=-Modo2(:,modo);
end
figure;
plot(Modo1(:,modo),'k');
hold on;
plot(Modo2(:,modo),'r');
ylabel('Mode 4','interpreter','latex','fontsize',15,'fontname',...
    'times new roman')
xlabel('node','interpreter','latex','fontsize',15,'fontname',...
    'times new roman')
if (handles.modelo==1)||(handles.modelo==2)||(handles.modelo==3)||...
        (handles.modelo==4)
    axis([1 26 -1 1]);
end
if handles.modelo==5
    axis([1 22 min(Modo1(:,modo)) max(Modo1(:,modo))]);
end
axis tight

modo=5;

if ((Modo1(8,modo)>0) && (Modo2(8,modo)<0)) || ((Modo1(8,modo)<0)...
&& (Modo2(8,modo)>0))
Modo2(:,modo)=-Modo2(:,modo);
end
figure;
plot(Modo1(:,modo),'k');
hold on;
plot(Modo2(:,modo),'r');
ylabel('Mode 5','interpreter','latex','fontsize',15,'fontname',...
    'times new roman')
xlabel('node','interpreter','latex','fontsize',15,'fontname',...
    'times new roman')
if (handles.modelo==1)||(handles.modelo==2)||(handles.modelo==3)||...
        (handles.modelo==4)
    axis([1 26 -1 1]);
end
if handles.modelo==5
    axis([1 22 min(Modo1(:,modo)) max(Modo1(:,modo))]);
end
axis tight

modo=6;

if ((Modo1(8,modo)>0) && (Modo2(8,modo)<0)) || ((Modo1(8,modo)<0)...
&& (Modo2(8,modo)>0))
Modo2(:,modo)=-Modo2(:,modo);
end
Modo2(:,modo)=-Modo2(:,modo);
figure;
plot(Modo1(:,modo),'k');
hold on;
plot(-Modo2(:,modo),'r');
ylabel('Mode 6','interpreter','latex','fontsize',15,'fontname',...
    'times new roman')
xlabel('node','interpreter','latex','fontsize',15,'fontname',...
    'times new roman')
if (handles.modelo==1)||(handles.modelo==2)||(handles.modelo==3)||...
        (handles.modelo==4)
    axis([1 26 -1 1]);
end
if handles.modelo==5
    axis([1 22 min(Modo1(:,modo)) max(Modo1(:,modo))]);
end
axis tight

modo=7;

if ((Modo1(8,modo)>0) && (Modo2(8,modo)<0)) || ((Modo1(8,modo)<0)...
&& (Modo2(8,modo)>0))
Modo2(:,modo)=-Modo2(:,modo);
end
figure;
plot(Modo1(:,modo),'k');
hold on;
plot(Modo2(:,modo),'r');
ylabel('Mode 7','interpreter','latex','fontsize',15,'fontname',...
    'times new roman')
xlabel('node','interpreter','latex','fontsize',15,'fontname',...
    'times new roman')
if (handles.modelo==1)||(handles.modelo==2)||(handles.modelo==3)||...
        (handles.modelo==4)
    axis([1 26 -1 1]);
end
if handles.modelo==5
    axis([1 22 min(Modo1(:,modo)) max(Modo1(:,modo))]);
end
axis tight

modo=8;

if ((Modo1(8,modo)>0) && (Modo2(8,modo)<0)) || ((Modo1(8,modo)<0)...
&& (Modo2(8,modo)>0))
Modo2(:,modo)=Modo2(:,modo);
end
figure;
plot(Modo1(:,modo),'k');
hold on;
plot(Modo2(:,modo),'r');
ylabel('Mode 8','interpreter','latex','fontsize',15,'fontname',...
    'times new roman')
xlabel('node','interpreter','latex','fontsize',15,'fontname',...
    'times new roman')
if (handles.modelo==1)||(handles.modelo==2)||(handles.modelo==3)||...
        (handles.modelo==4)
    axis([1 26 -1 1]);
end
if handles.modelo==5
    axis([1 22 min(Modo1(:,modo)) max(Modo1(:,modo))]);
end
axis tight

modo=9;

if ((Modo1(8,modo)>0) && (Modo2(8,modo)<0)) || ((Modo1(8,modo)<0)...
&& (Modo2(8,modo)>0))
Modo2(:,modo)=Modo2(:,modo);
end
figure;
plot(Modo1(:,modo),'k');
hold on;
plot(Modo2(:,modo),'r');
ylabel('Mode 9','interpreter','latex','fontsize',15,'fontname',...
    'times new roman')
xlabel('node','interpreter','latex','fontsize',15,'fontname',...
    'times new roman')
if (handles.modelo==1)||(handles.modelo==2)||(handles.modelo==3)||...
        (handles.modelo==4)
    axis([1 26 -1 1]);
end
if handles.modelo==5
    axis([1 22 min(Modo1(:,modo)) max(Modo1(:,modo))]);
end
axis tight

modo=10;

if ((Modo1(8,modo)>0) && (Modo2(8,modo)<0)) || ((Modo1(8,modo)<0)...
&& (Modo2(8,modo)>0))
Modo2(:,modo)=-Modo2(:,modo);
end
figure;
plot(Modo1(:,modo),'k');
hold on;
plot(Modo2(:,modo),'r');
ylabel('Mode 10','interpreter','latex','fontsize',15,'fontname',...
    'times new roman')
xlabel('node','interpreter','latex','fontsize',15,'fontname',...
    'times new roman')
if (handles.modelo==1)||(handles.modelo==2)||(handles.modelo==3)||...
        (handles.modelo==4)
    axis([1 26 -1 1]);
end
if handles.modelo==5
    axis([1 22 min(Modo1(:,modo)) max(Modo1(:,modo))]);
end
axis tight

%--------------------------end--------------------------------------------
