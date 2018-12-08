clear all;
clc;
imagen=imread('imagen002','JPEG');

r=double(imagen(:,:,1)); %Extrae el componente rojo 
g=double(imagen(:,:,2)); %Extrae el componente verde 
b=double(imagen(:,:,3)); %Extrae el componente azul 

[X,Y,Z]=size(imagen);
grises=uint8(zeros(X,Y)); %inicializa la matriz para grises

for i=1:X
    for j=1:Y
        grises(i,j)=uint8((r(i,j)+g(i,j)+b(i,j))/3);
    end
end

imagenR = (r-b-g);
imagenV = (g-r-b);
imagenA = (b-r-g);

imagen_final_roja=filtro(imagenR,grises,1,255,254,254);
imagen_final_verde=filtro(imagenV,grises,1,254,255,254);
imagen_final_azul=filtro(imagenA,grises,1,254,254,255);

r2=rgb2hsv(imagen_final_roja);
g2=rgb2hsv(imagen_final_verde);
b2=rgb2hsv(imagen_final_azul);

figure
subplot(2,3,2),imshow(imagen),title('Figura Original')
subplot(2,3,4),imshow(imagen_final_roja),title('Filtro Rojo')
subplot(2,3,5),imshow(imagen_final_verde),title('Filtro Verde')
subplot(2,3,6),imshow(imagen_final_azul),title('Filtro Azul')

figure(2)
subplot(2,3,2),imshow(imagen),title('Figura Original')
subplot(2,3,6),imshow(r2),title('Filtro Rojo HSV')
subplot(2,3,4),imshow(g2),title('Filtro Verde HSV')
subplot(2,3,5),imshow(b2),title('Filtro Azul HSV')