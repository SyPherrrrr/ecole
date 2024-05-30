'use strict';




async function loadgenres() {
    let genres_ = '';

    try {
        const response = await fetch('lien/vers/lapi');

        const genres = await response.json();

        genres_ = genres;
    
    } catch(erreur) {
        console.log(erreur);
    }

    // Selection d'un élément
    const select = document.querySelector('Select');

    // Création d'un élément 
    const option = document.createElement('option');
    option.text = genres_[0].name;
    option.value = genres_[0].id;

    // Ajout d'un élément dans un autre
    select.add(option);

    select.addEventListener("change", () => {


        const select = document.querySelector('select');

        const genre_selected = genres_.find((element) => element.id === select.value);

        loadArtists(genre_selected);


    })


}

async function loadArtists(genre_selected) {

    const section = document.getElementById('main');

    const h2 = section.querySelector('h2');
    h2.textContent = "Top " + genre_selected.name +" artists";


    // Pour selectionner le premier p dans la section
    const p = section.querySelector('#main > p');
    p.textContent = genre_selected.description;


    let tab_artists_ ={};
    try {
        const tab_artists_ = await fetch('lien/vers/lapi/'+genre_selected.id);
        const tab_artists_json = await tab_artists_.json();
        tab_artists_ = tab_artists_json;

    } catch(erreur) {
        console.log(erreur);
    }

    tab_artists_.array.forEach(element => {
        
    });

    const ul = document.querySelector('')
    while(ul.firstChild) {
        ul.removeChild(ul.firstChild);
    }

    tab_artists_.forEach((artist) => {

        const li = document.createElement('li');
        const h3 = document.createElement('h3');
        const a = document.createElement('a');
        const img = document.createElement('img');
        const ul = section.getElements('ul');

        // Remplissage des données
        h3.textContent = artist.name;
        // Création du boutton de la forme: (<a><h3>Blabla</h3></a>)
        a.href = '#';
        a.textContent = artist.name;

        img.src = artist.photo;

        // grand.appendChild(petit)
        a.appendChild(h3);
        li.appendChild(a);
        li.appendChild(img);
        ul.appendChild(li);

        a.addEventListener("click", () => artistSelected(artist.id));
    })


}



async function artistSelected(id_artist) {
    let tab_albums = {};

    try {
        const response = await fetch('lien/vers/lapi/'+id_artist);
        const tab_album_json = await response.json();
        tab_albums = tab_album_json;

    } catch(erreur) {
        console.log(erreur);
    }

    const aside = document.getElementById('albums');
    aside.style.visibility = "visible";
    aside.style.opacity = "1";
    aside.style.transition = "opacity 0.5s ease-in-out";
    
    // Pour centrer le popup
    const bodyWidth = document.body.clientWidth;
    const bodyHeight = document.body.clientHeight;
    const popupWidth = popup.clientWidth;
    const popupHeight = popup.clientHeight;
    const leftPosition = (bodyWidth - popupWidth) / 2;
    const topPosition = (bodyHeight - popupHeight) / 2;

    aside.top = topPosition + "px";
    aside.left = leftPosition + "px";

    const boutton = document.querySelector('button');
    boutton.addEventListener("click", () => {
        aside.style.visibility = "hidden";
        aside.style.opacity = "0";
        aside.style.transition = "opacity 0.5s ease-in-out";
    })
}