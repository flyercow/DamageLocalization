%   Programa: A_Modelo1_Viga_biempotrada_damage    
%   Autor: Sergio Vigorra Trevi�o  
%-------------------------------------------------------------------------
%    Prop�sito: Este programa modela el comportamiento din�mico de una 
%               viga biempotrada en la que se ha producido un da�o.
%      
%    Entradas: los par�metros de entrada son la localizaci�n del da�o
%              y el porcentaje de da�o.
%    
%    Salidas: vector con las frecuencias naturales y matriz con los modos
%             de vibraci�n.
%    
%    Detalles del modelo: se trata de una viga biempotrada con una 
%                         longitud de 5 metros y un perfil IPE 80,
%                         discretizada en 25 elementos.
%-------------------------------------------------------------------------

function [Freq,Egv]=A_Modelo1_Viga_biempotrada_damage(localiz,damage)

daminv=((100-damage)/100);
elemdamaged=localiz;

%Datos de materiales, IPE 80
E=3e10;
rho=2500;
A=0.0764e-2;
I=0.00801e-4;          
ep=[E A I rho*A];

%Datos de materiales, elemento da�ado
epd=[daminv*E A I rho*A];

%Topolog�a
Edof=[1   1  2  3  4  5  6;
      2   4  5  6  7  8  9;
      3   7  8  9 10 11 12;
      4  10 11 12 13 14 15;
      5  13 14 15 16 17 18;
      6  16 17 18 19 20 21;
      7  19 20 21 22 23 24; 
      8  22 23 24 25 26 27;
      9  25 26 27 28 29 30;
      10 28 29 30 31 32 33;
      11 31 32 33 34 35 36;
      12 34 35 36 37 38 39;
      13 37 38 39 40 41 42;
      14 40 41 42 43 44 45;
      15 43 44 45 46 47 48;
      16 46 47 48 49 50 51;
      17 49 50 51 52 53 54;
      18 52 53 54 55 56 57;
      19 55 56 57 58 59 60;
      20 58 59 60 61 62 63;
      21 61 62 63 64 65 66;
      22 64 65 66 67 68 69;
      23 67 68 69 70 71 72;
      24 70 71 72 73 74 75;
      25 73 74 75 76 77 78];
     
%Coordenadas
Coord=[0.00  0;
       0.20  0;
       0.40  0;
       0.60  0;
       0.80  0;
       1.00  0;
       1.20  0;
       1.40  0;
       1.60  0;
       1.80  0;
       2.00  0;
       2.20  0;
       2.40  0;
       2.60  0;
       2.80  0;
       3.00  0;
       3.20  0;
       3.40  0;
       3.60  0;
       3.80  0;
       4.00  0;
       4.20  0;
       4.40  0;
       4.60  0;
       4.80  0;
       5.00  0;];

%Grados de libertad
Dof=[1  2  3;  
     4  5  6;
     7  8  9;
     10 11 12;
     13 14 15;
     16 17 18;
     19 20 21;
     22 23 24; 
     25 26 27;
     28 29 30;
     31 32 33;
     34 35 36;
     37 38 39;
     40 41 42;
     43 44 45;
     46 47 48;
     49 50 51;
     52 53 54;
     55 56 57;
     58 59 60;
     61 62 63;
     64 65 66;
     67 68 69;
     70 71 72;
     73 74 75;
     76 77 78];


%Creaci�n y ensamblaje de las matrices 
K=zeros(78);     M=zeros(78);
[Ex,Ey]=coordxtr(Edof,Coord,Dof,2); 

for i=1:25
   [k,m,c]=beam2d(Ex(i,:),Ey(i,:),ep);
   K=assem(Edof(i,:),K,k);  M=assem(Edof(i,:),M,m);  
end

[k,m,c]=beam2d(Ex(elemdamaged,:),Ey(elemdamaged,:),epd);
K=assem(Edof(elemdamaged,:),K,k);  M=assem(Edof(elemdamaged,:),M,m); 
   
%Condiciones de contorno
b=[1 2 3 76 77 78]';             

%An�lisis din�mico
[La,Egv]=eigen(K,M,b);
Freq=sqrt(La)/(2*pi);

%--------------------------end--------------------------
