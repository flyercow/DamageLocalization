%   Programa: A_Modelo5_celosia_DLV    
%   Autor: Sergio Vigorra Treviño  
%-------------------------------------------------------------------------
%    Propósito: Este programa modela el comportamiento estático de una
%               celosía, para realizar los cálculos estáticos necesarios
%               para el método DLV.
%      
%    Entradas: vector de fuerzas proveniente del programa de DLV.
%    
%    Salidas: tensiones en cada elemento de la celosía.
%    
%    Detalles del modelo: se trata de una celosía de acero formada por 10
%                         módulos de 3 metros de largo, y una altura de 
%                         4,5 metros. Las barras tienen un área transver-
%                         sal de 64.5 cm2.  
%
%-------------------------------------------------------------------------

function es=A_Modelo5_celosia_DLV(f)

%Datos de materiales
E=2e10;                 
rho=2500;
A=0.00645;   
r=sqrt(A/pi);
I=(pi/4)*(r^4); 

%Topología
Edof=[1   1  2  3  4;  
      2   3  4  5  6;
      3   5  6  7  8;
      4   7  8  9 10;
      5   9 10 11 12;
      6  11 12 13 14;
      7  13 14 15 16; 
      8  15 16 17 18;
      9  17 18 19 20;
      10 19 20 21 22;
      11 23 24 25 26;
      12 25 26 27 28;
      13 27 28 29 30;
      14 29 30 31 32;
      15 31 32 33 34; 
      16 33 34 35 36;
      17 35 36 37 38;
      18 37 38 39 40;
      19 39 40 41 42;
      20 41 42 43 44;
      21  1  2 23 24;  
      22  3  4 25 26; 
      23  5  6 27 28;
      24  7  8 29 30;
      25  9 10 31 32;
      26 11 12 33 34;
      27 13 14 35 36;
      28 15 16 37 38;
      29 17 18 39 40;
      30 19 20 41 42; 
      31 21 22 43 44;
      32  1  2 25 26;
      33  3  4 27 28;
      34  5  6 29 30;
      35  7  8 31 32;
      36  9 10 33 34; 
      37 11 12 35 36;
      38 13 14 37 38; 
      39 15 16 39 40;
      40 17 18 41 42;
      41 19 20 43 44; 
      42  5  6 25 26; 
      43 11 12 31 32;
      44 17 18 37 38;];
      
%Coordendas de los nodos
Coord=[0.0 0.0                          
       3.0 0.0;
       6.0 0.0;
       9.0 0.0;
       12.0 0.0;
       15.0 0.0;
       18.0 0.0;
       21.0 0.0;
       24.0 0.0;
       27.0 0.0;
       30.0 0.0;
        0.0 4.5;               
        3.0 4.5;
        6.0 4.5;
        9.0 4.5;
       12.0 4.5;
       15.0 4.5;
       18.0 4.5;
       21.0 4.5;
       24.0 4.5;
       27.0 4.5;
       30.0 4.5;];
   
%Grados de libertad
Dof=[ 1  2;             
      3  4;
      5  6;
      7  8;  
      9 10; 
     11 12;
     13 14;
     15 16;
     17 18;
     19 20;
     21 22;
     23 24; 
     25 26;
     27 28;
     29 30;
     31 32;
     33 34;
     35 36;
     37 38;
     39 40;
     41 42;
     43 44;];
 
K=zeros(44);        
[ex,ey]=coordxtr(Edof,Coord,Dof,2); 
ep=[E A I];

for i=1:44
    Ke=bar2e(ex(i,:),ey(i,:),ep); 
    K=assem(Edof(i,:),K,Ke);
end; 

bc=[1 0;2 0;22 0;23 0;24 0;];  
[a,r]=solveq(K,f,bc);
ed=extract(Edof,a);

for i=1:44
    N(i,:)=abs(bar2s(ex(i,:),ey(i,:),ep,ed(i,:)));
end

es=N;
%--------------------------end--------------------------
