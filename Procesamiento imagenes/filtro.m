function imagen_final = filtro (imagen,grises,umbral,r,g,b)
    imagenBinaria = imagen > umbral;
    imagenBinariaFiltrada = medfilt2(imagenBinaria);
    mascara = 1-imagenBinariaFiltrada;
    
    if r==255
       imagen_roja = double(grises)/r;
       imagen_verde = double(grises).* mascara/g;
       imagen_azul = double(grises).* mascara/b;
    end
    if g==255
       imagen_roja = double(grises).* mascara/r;
       imagen_verde = double(grises)/g;
       imagen_azul = double(grises).* mascara/b;
    end
    if b==255
       imagen_roja = double(grises).* mascara/r;
       imagen_verde = double(grises).* mascara/g;
       imagen_azul = double(grises)/b;
    end   

    imagen_final = cat(3,imagen_roja,imagen_verde,imagen_azul); 
end