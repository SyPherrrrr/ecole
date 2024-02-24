/*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%                                                                         %
%     Calcul de l'induction magnétique créée autour de 2 fils infinis     %
%                       parcourus par un courant +I                       %
%                                                                         %
%                                                                         %
%                                                                         %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/
 
close()
clear

for t =0:0.5:20
        // DONNÉES GEOMETRIQUES
     
    // Données communes aux 2 fils
    R = 1e-3;                 //Rayon fils de cuivre  (en m)
    ep_gaine = 0.1e-3;        //Epaisseur gaines (en m)
     
    //Données fil de gauche
    xOg = -(R + ep_gaine);       //Centre fil de gauche
    yOg = 0;
     
    //Données fil de droite
    xOd = R + ep_gaine;      //Centre fil de droite
    yOd = 0
    
    //Points de calcul
    dist_mesure_depuis_surface = 15*10^-4;            // distance mesurée depuis la surface de la gaine
    rayon_mesure = R + dist_mesure_depuis_surface;
    nb_points = 360;                               // nombre de points de calcul
    teta = linspace(0,2*%pi,nb_points);           // angle en radians des nb_points             
    X_mg = rayon_mesure*cos(teta) + xOg;              // calcul vectoriel des abscisses des nb_points pour le champ du fil de gauche
    Y_mg = rayon_mesure*sin(teta) + yOg;              // calcul vectoriel des ordonnées des nb_points pour le champ du fil de gauche
    
    X_md = rayon_mesure*cos(teta) + xOd;              // calcul vectoriel des abscisses des nb_points pour le champ du fil de droite
    Y_md = rayon_mesure*sin(teta) + yOd;              // calcul vectoriel des ordonnées des nb_points pour le champ du fil de droite
    
    distg = sqrt(X_mg.^2+Y_mg.^2);               // distance entre l'origine et les nb_point (vecteur)
    tetag = atan(Y_mg,X_mg);                    // angle en radians entre l'axe x et les nb_points
     
    distd = sqrt(X_md.^2+Y_md.^2);               // distance entre l'origine et les nb_point (vecteur)
    tetad = atan(Y_md,X_md);                    // angle en radians entre l'axe x et les nb_points
    
    
    alphag = tetag + 2*%pi/3;
    alphad = tetad + 2*%pi/3;
    
    gamg = tetag - 2*%pi/3;
    gamd = tetad - 2*%pi/3;
    
    X_mt = 2.4e-3*cos(teta);        //calcul vectoriel des abscisses des nb_points pour le champ total
    Y_mt = 2.4e-3*sin(teta);        //calcul vectoriel des ordonnées des nb_points pour le champ total
    
    
     
    //DONNÉES PHYSIQUES
    courant1 = t;                // courant
    mu0 = 4*%pi*1e-7;                           // perméabilité magnétique du vide
    
        Bxg = -(mu0/(2*%pi))*(courant1*sin(tetag)./distg);          //Induction magnétique suivant la composante x du fil de gauche chargé négativement
        Byg = -(mu0/(2*%pi))*(courant1*(-cos(tetag))./distg);       //Induction magnétique suivant la composante y du fil de gauche chargé négativement
        
         // Deuxième Capteur fil gauche
        Bxg2 = -(mu0/(2*%pi))*(courant1*sin(alphag)./distg);
        Byg2 = -(mu0/(2*%pi))*(courant1*(-cos(alphag))./distg);       //Induction magnétique suivant la composante y du fil de gauche chargé négativement
        
         // Troisième Capteur fil gauche
        Bxg3 = -(mu0/(2*%pi))*(courant1*sin(gamg)./distg);
        Byg3 = -(mu0/(2*%pi))*(courant1*(-cos(gamg))./distg);
        
         // Premier Capteur fil droit
        Bxd = (mu0/(2*%pi))*(courant1*sin(tetad)./distd);         //Induction magnétique suivant la composante x du fil de droite
        Byd = (mu0/(2*%pi))*(courant1*(-cos(tetad))./distd);      //Induction magnétique suivant la composante y du fil de droite
        
         // Deuxième Capteur fil droit 
        Bxd2 = (mu0/(2*%pi))*(courant1*sin(alphad)./distd);
        Byd2 = (mu0/(2*%pi))*(courant1*(-cos(alphad))./distd);
        
         // Troisième Capteur fil droit
        Bxd3 = (mu0/(2*%pi))*(courant1*sin(gamd)./distd);
        Byd3 = (mu0/(2*%pi))*(courant1*(-cos(gamd))./distd);
        
        // Induction totale
         // 1er Capeteur 
        Bxt = sqrt((Bxg + Bxd)^2);     //Induction magnétique totale suivant la composante x
        Byt = sqrt((Byg + Byd)^2);     //Induction magnétique totale suivant la composante y
        
         // 2e Capteur
        Bxt2 = sqrt((Bxg2 + Bxd2)^2);
        Byt2 = sqrt((Byg2 + Byd2)^2);
        
         // 3e Capteur
        Bxt3 = sqrt((Bxg3 + Bxd3)^2);
        Byt3 = sqrt((Byg3 + Byd3)^2);
        
        // CALCUL DES INDUCTIONS MAGNÉTIQUES TANGENTIELLE ET NORMALE A LA GAINE
        
        // Max des fonctions 
        G = max(Bxt,Byt,Bxt2,Byt2,Bxt3,Byt3);    // G est un vecteur avec en composantes le max de Bxt,Byt,Bxt2,Byt2,Bxt3,Byt3
        Gmax = max(G);
        Gmin = min(G);
        Gmoy = mean(G);
        Kmax = Gmax/courant1;
        Kmoy = Gmoy/courant1;
        Kmin = Gmin/courant1;
    
        Gx = max(Bxt,Bxt2,Bxt3);    
        Gxmax = max(Gx);
        Gxmin = min(Gx);
        Gxmoy = mean(Gx);
        Kxmax = Gxmax/courant1;
        Kxmoy = Gxmoy/courant1;
        Kxmin = Gxmin/courant1;
        
        Gymax = max(Byt,Byt2,Byt3);
        Gymin = min(Byt,Byt2,Byt3);
        Gymoy = mean(Byt,Byt2,Byt3);
        //Gymax = max(Gy);
        //Gymin = min(Gy);
        //Gymoy = mean(Gy);
        Kymax = Gymax/courant1;
        Kymoy = Gymoy/courant1;
        Kymin = Gymin/courant1;
    
        Bteta = -Bxt.*sin(teta) + Byt.*cos(teta);     // Induction magnétique tangentielle à la gaine
        Br = Bxt.*cos(teta) + Byt.*sin(teta);         // Induction magnétique normale à la gaine
        
        Bteta2 = -Bxt2.*sin(teta) + Byt2.*cos(teta);
        Br2 = Bxt2.*cos(teta) + Byt2.*sin(teta);
        
        Bteta3 = -Bxt3.*sin(teta) + Byt3.*cos(teta);
        Br3 = Bxt3.*cos(teta) + Byt3.*sin(teta);


    if t == 10
        // VISUALISATION DE LA SOLUTION
        
        
        figure
        plot(R*cos(tetag) + xOg,R*sin(tetag) + yOg);                          //Affichage fil cuivre de gauche
        plot((R+ep_gaine)*cos(tetag) + xOg,(R+ep_gaine)*sin(tetag) + yOg);    //Affichage gaine plastique de gauche
        plot(R*cos(tetad) + xOd,R*sin(tetad) + yOd);                          //Affichage fil cuivre de droite
        plot((R+ep_gaine)*cos(tetad) + xOd,(R+ep_gaine)*sin(tetad) + yOd);    //Affichage gaine plastique de droite
        plot(2.2e-3*cos(teta),2.2e-3*sin(teta)); //Affichage grosse gaine
        plot(2.4e-3*cos(teta),2.4e-3*sin(teta));
        plot(X_mt,Y_mt, 'b.');    //Affichage des points de calcul total
        coef=2000;                // coeficient permettant de régler la longueur des vecteurs
        xarrows([X_mt;X_mt+(Bxt/max(Bxt))/coef],[Y_mt;Y_mt+(Byt/max(Bxt))/coef])
        mtlb_axis('equal');
         
        figure                                  // Affichage des différentes figures
        plot(teta*180/%pi,Bxt,teta*180/%pi,Bxt2,teta*180/%pi,Bxt3);  
        title('Composante B_x sur 3 capteurs');
        xlabel('angle en degrés');
        ylabel('induction magnétique en Tesla');
        
        figure                                  // Affichage des différentes figures
        plot(teta*180/%pi,Byt,teta*180/%pi,Byt2,teta*180/%pi,Byt3);   
        title('Composante B_y sur 3 capteurs');
        xlabel('angle en degrés');
        ylabel('induction magnétique en Tesla');
        
        figure                                  // Affichage des différentes figures
        plot(teta*180/%pi,Br,teta*180/%pi,Br2,teta*180/%pi,Br3);   
        title('Composante B_r sur 3 capteurs');
        xlabel('angle en degrés');
        ylabel('induction magnétique en Tesla');

        figure                                  // Affichage des différentes figures
        plot(teta*180/%pi,Bteta,teta*180/%pi,Bteta2,teta*180/%pi,Bteta3);   
        title('Composante B_teta sur les 3 capteurs');
        xlabel('angle en degrés');
        ylabel('induction magnétique en Tesla');
        
        figure
        plot(teta*180/%pi,Byt,teta*180/%pi,Byt2,teta*180/%pi,Byt3,teta*180/%pi,Bxt,teta*180/%pi,Bxt2,teta*180/%pi,Bxt3);
        title('Composantes B_y et B_x sur les 3 capteurs');
        xlabel('angle en degrés');
        ylabel('induction magnétique en Tesla');

    end
end

courant1 = 0:0.5:20;
figure
plot(courant1,Gymin,courant1,Gymax);
title('Kmax Kmin Kmoy');
xlabel('courant');
ylabel('G');

//figure
//plot(teta*180/%pi,Byt,teta*180/%pi,Byt2,teta*180/%pi,Byt3);
//title('Composante B_y sur 3 capteurs');
//xlabel('angle en degrés');
//ylabel('induction magnétique en Tesla');

figure(1)
plot(teta*180/%pi,G);
title('Max');
xlabel('angle en degrés');
ylabel('induction magnétique en Tesla');

figure
plot(teta*180/%pi,Gmax,teta*180/%pi,Gmin);
title('G');
xlabel('angle en degrés');
ylabel('induction magnétique en Tesla');



//figure
//plot(teta*180/%pi,Br);   
//title('Composante B_r');
//xlabel('angle en degrés');
//ylabel('induction magnétique en Tesla');

//figure
//plot(teta*180/%pi,Bteta,teta*180/%pi,Bteta2);   
//title('Composante B_teta');
//xlabel('angle en degrés');
//ylabel('induction magnétique en Tesla');
