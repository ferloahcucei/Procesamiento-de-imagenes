%Alumno: INCO José Fernando López Aguilar Hernández 
%Materia: Seminario de Inteligencia Artificial II
%Universidad de Guadalajara CUCEI

clear all;
close all;
clc;
imagen=imread('imagen001','JPEG');

r1=imagen(:,:,1); % Extrae el componente rojo 
g1=imagen(:,:,2); % Extrae el componente verde 
b1=imagen(:,:,3); % Extrae el componente azul 

bw=im2bw(r1,0.9); % Binarización de capa r1
bwml=bwareaopen(bw,20000); % Aplicación de filtro

[m,n]=size(bwml);
for i=1:m
    for j=1:n
        if bwml(i,j)==1
           bwml(i,j)=0;
        else
           bwml(i,j)=1;
        end
    end
end

se = strel('disk',10);    % Elemento estructurante;
bwml=imclose(bwml,se);    % Dilatación de imagen para eliminar ruido;
bwml=bwareaopen(bwml,10); % Aplicación de filtro;
CC=bwconncomp(bwml);      % Identificación de componentes de la imagen;
L=labelmatrix(CC);        % Aplicación de etiquetas a cada componente de la imagen;
[m,n]=size(L);            % Tamaño de la imagen etiquetada;

t1=1;   
t2=2;   
t3=3;   

% Binarización de la imagen por cada objeto etiquetado 

for i=1:m
    for j=1:n
        if L(i,j)~=t1
            salida1(i,j)=0;
        else
            salida1(i,j)=1;
        end
        if L(i,j)~=t2
            salida2(i,j)=0;
        else
            salida2(i,j)=1;
        end
        if L(i,j)~=t3
            salida3(i,j)=0;
        else
            salida3(i,j)=1;
        end
    end
end
RGB=label2rgb(L,@jet,[.5 .5 .5]); % Construye la imagen  RGB con las etiquetas

primera=bwlabel(salida1);
segunda=bwlabel(salida2);
tercera=bwlabel(salida3);

stats1 = regionprops(primera,'all');
centroide1=stats1.Centroid;

x1=centroide1(1);
y1=centroide1(2);

stats2 = regionprops(segunda,'all');
centroide2=stats2.Centroid;

x2=centroide2(1);
y2=centroide2(2);

stats3 = regionprops(tercera,'all');
centroide3=stats3.Centroid;

x3=centroide3(1);
y3=centroide3(2);

x=[x1,x2,x3];
y=[y1,y2,y3];

str=['manzana';'manzana';'manzana'];

figure
subplot(2,1,1),imshow(imagen),title('Imagen original')
subplot(2,1,2),imshow(imagen),title('Objeto Etiquetado')
text(x,y,str)












