%   Programa: A_Modelo4_Viga_voladizo_DLV    
%   Autor: Sergio Vigorra Treviño  
%-------------------------------------------------------------------------
%    Propósito: Este programa modela el comportamiento dinámico de una 
%               viga en voladizo, para realizar los cálculos estáticos
%               necesario para el método DLV.
%      
%    Entradas: vector fuerzas procedente del programa del método DLV.
%    
%    Salidas: tensiones en los elementos que componen la estructura.
%    
%    Detalles del modelo: se trata de una viga con el extremo izquierdo
%                         empotrado y el derecho libre, con una longitud 
%                         de 5 metros y un perfil IPE 80, discretizada en 
%                         25 elementos.
%
%-------------------------------------------------------------------------

function es=A_Modelo4_Viga_voladizo_DLV(f)

E=3e10;                 rho=2500;
Ah=0.0764e-2;           Ih=0.00801e-4;  

%Topología
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
     
%Coordenadas de los modos
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
 
K=zeros(78);   
ep=[E Ah Ih];
 
[Ex,Ey]=coordxtr(Edof,Coord,Dof,2);
 
for i=1:25
    ke=beam2e(Ex(i,:),Ey(i,:),ep);
    K=assem(Edof(i,:),K,ke);  
end

bc=[1 0;2 0;3 0;];     
[a,r]=solveq(K,f,bc);
Ed=extract(Edof,a);
es=zeros(2,3,25);

for i=1:25
   es(:,:,i)=beam2s(Ex,Ey,ep,Ed(i,:));
end

%--------------------------end--------------------------
