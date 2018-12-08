clear all;
close all;
clc;
imagen=imread('imagen001','JPEG');
umbral = graythresh(imagen);
imagen_bw = im2bw(imagen,umbral);
imagen_bw_label = bwlabel(imagen_bw);

se = strel('disk',10); 
imagen_bw_label = imclose(imagen_bw_label,se); 
imagen_bw_label = 1 - imagen_bw_label;
imagen_bw_label=bwareaopen(imagen_bw_label,10);

% imshow(label2rgb(imagen_bw_label));
imshow(imagen);
propiedades = regionprops(imagen_bw_label);

for i=1:length(propiedades)
    caja = propiedades(i).BoundingBox;
    rectangle('Position',[caja(1),caja(2),caja(3),caja(4)],'EdgeColor','r','LineWidth',3);
end
