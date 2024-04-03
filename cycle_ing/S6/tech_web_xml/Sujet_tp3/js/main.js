'use strict';
/* eslint-env browser, es6 */

// Pas besoin d'évenement window.onload puisqu'on utilise l'attribut defer
// lorsque l'on charge notre script


// async pour les fonctions asynchrones
async function loadGenres() {
    let genre = ""; // variable modifiable qui permet d'avoir les genres partout et pas que dans try catch
    try {
        // await permet d'attendre que fetch(ou autre chose) soit finis pour passer à la suite
        const response = await fetch("http://localhost:3000/genres");
        const genres = await response.json();
        genre = genres;
        console.log(genres);
    } catch(erreur) {
        console.log(erreur);
    }

    // on sélectionne l'élément select du code html et on le met dans une variable
    const select = document.querySelector("select");

    // on créé un élément de type option et on le stock dans option
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


    select.add(option1);
    select.add(option2);
    select.add(option3);


    // addEventListener permet d'executer le code entre crochets quand une option de la liste est choisie.
    select.addEventListener("change",() => {

        const select = document.querySelector("select");


        // permet de trouver dans le tableau genre, le premier genre qui est égal au genre selectionné dans select
        const found = genre.find((element) => element.id === select.value); 

        loadArtists(found);
        
    });


    loadArtists(genre[0]); // Permet de charger les données dès le permier chargement de la page (hors sélection d'un genre)


}


loadGenres();


async function loadArtists(genre) {

    // selection de la section main
    const section = document.getElementById("main");

    // selection du titre h2 dans la section main
    const h2 = section.querySelector("h2");
    //On modifie le titre
    h2.textContent = "Top " + genre.name + " Artists";

    // Permet de sélectionner le premier paragraphe de section sans avancer dans l'arboressence
    const p = document.querySelector("#main > p");
    p.textContent = genre.description;

    


}

