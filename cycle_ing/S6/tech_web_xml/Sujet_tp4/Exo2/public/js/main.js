'use strict';
/* eslint-env browser, es6 */

// Pas besoin d'évenement window.onload puisqu'on utilise l'attribut defer
// lorsque l'on charge notre script


// async pour les fonctions asynchrones
async function loadGenres() {
    let genre = ""; // variable modifiable qui permet d'avoir les genres partout et pas que dans le try catch
    try {
        // await permet d'attendre que le fetch(ou autre chose) soit finis pour passer à la suite
        const response = await fetch("/api/genres");
        const genres = await response.json();
        genre = genres;
    } catch(erreur) {
        console.log(erreur);
    }

    // on sélectionne l'élément select du code html et on le met dans une variable
    const select = document.querySelector("select");
    
    // on créé un élément de type option et on le stock dans option1
    // pour chaque élément option on va remplir l'attribut text avec le nom et l'attribut value avec l'id
    const option1 = document.createElement("option");
    option1.text = genre[0].name;
    option1.value = genre[0].id;


    const option2 = document.createElement("option");
    option2.text = genre[1].name;
    option2.value = genre[1].id;


    const option3 = document.createElement("option");
    option3.text = genre[2].name;
    option3.value = genre[2].id;

    // Ajout des options dans le select
    select.add(option1);
    select.add(option2);
    select.add(option3);


    // addEventListener permet d'executer le code entre crochets quand une option de la liste est choisie
    select.addEventListener("change",() => {

        const select = document.querySelector("select");


        // permet de trouver dans le tableau genre, le premier genre qui est égal au genre selectionné dans select
        const genre_select = genre.find((element) => element.id === select.value); 

        loadArtists(genre_select);
        
    });

    // Permet de charger les données dès le permier chargement de la page (hors sélection d'un genre)
    loadArtists(genre[0]);

}


loadGenres();



async function loadArtists(genre) {

    // selection de la section main
    const section = document.getElementById("main");

    // selection du titre h2 dans la section main
    const h2 = section.querySelector("h2");
    //On modifie le titre
    h2.textContent = "Top " + genre.name + " Artists";

    // Permet de sélectionner le premier paragraphe de section main sans avancer dans l'arboressence
    const p = document.querySelector("#main > p");
    p.textContent = genre.description;

    // mise à jour des top artistes avec leurs noms et images
    // variable globale
    let tab_artist = {};
    try {
        const response = await fetch("api/genres/"+genre.id+"/artists");
        const tab_artists = await response.json();
        tab_artist = tab_artists
    } catch(erreur) {
        console.log(erreur);
    }

    // Pour update les images et noms des top artistes quand on sélectionne autre chose
    const ul = section.querySelector("ul");
    while (ul.firstChild) {
        ul.removeChild(ul.firstChild);
    }

    
    // Parcourir tous les artistes du tableau pour le genre séléctionné
    tab_artist.forEach(artist => {

        // création d'éléments
        const li = document.createElement("li");
        const a = document.createElement("a");
        const h3 = document.createElement("h3");
        const img = document.createElement("img");
        const ul = section.querySelector("ul");

        // Ajout du nom dans h3
        h3.textContent = artist.name;
        
        // Ajout de l'image
        img.src = artist.photo;

        // création du boutton
        a.href = "#";
        a.id = artist.name;

        //Gestion de l'arborescence 
        a.appendChild(h3);
        li.appendChild(a);
        li.appendChild(img);
        ul.appendChild(li);


        // Partie 2 : chargement des albums

        a.addEventListener("click",() => artistSelected(artist.id));

    });



        

}


// Fonction qui permet de charger les albums de l'artiste cliqué
async function artistSelected(id_artist) {
    try {
        const response = await fetch("api/artists/" + id_artist + "/albums");
        const tab_album = await response.json();

        // Affichage du popup une fois les données récupérées sans erreur
        const popup = document.querySelector("#albums");
        popup.style.visibility = "visible";
        popup.style.opacity = "1";
        popup.style.transition = "opacity 0.5s ease-in-out";

        // Calcul de la position pour centrer le popup
        const bodyWidth = document.body.clientWidth;
        const bodyHeight = document.body.clientHeight;
        const popupWidth = popup.clientWidth;
        const popupHeight = popup.clientHeight;
        const leftPosition = (bodyWidth - popupWidth) / 2;
        const topPosition = (bodyHeight - popupHeight) / 2;

        // Application de la position centrée au popup
        popup.style.left = leftPosition + "px";
        popup.style.top = topPosition + "px";


        const button = document.querySelector("button");
        button.addEventListener("click", () => {

            // Supprimer les données du popup
            const tbody = document.querySelector("tbody");
            while (tbody.firstChild) {
                tbody.removeChild(tbody.firstChild);
            }

            // Fermeture du popup
            popup.style.visibility = "hidden";
            popup.style.opacity = "0";
            
        });

        tab_album.forEach(album => {

            //Body du tableau
            const tbody = document.querySelector("tbody");

            // tr pour chaque ligne du tableau
            const tr = document.createElement("tr");


            // Données de chaque album
            // Création d'une balise td et image pour la cover 
            const dataCell1 = document.createElement("td");
            const img = document.createElement("img");
            img.src = album.cover;
            dataCell1.appendChild(img);
            
            // création des balises td pour stocker les données
            const dataCell2 = document.createElement("td");
            dataCell2.textContent = album.title;

            const dataCell3 = document.createElement("td");
            dataCell3.textContent = album.year;

            const dataCell4 = document.createElement("td");
            dataCell4.textContent = album.label;

            
            // Ajout des données d'un album (représentant une ligne)
            tr.appendChild(dataCell1);
            tr.appendChild(dataCell2);
            tr.appendChild(dataCell3);
            tr.appendChild(dataCell4);

            tbody.appendChild(tr);

        });

    } catch (error) {
        console.log(error);
    }
}
