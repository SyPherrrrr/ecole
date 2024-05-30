const express = require('express');
const app = express();
const db = require('./data/db.json');

app.get('/genres',   (req, res) => {

    const genres =  JSON.stringify(db.genres);

    res.json(genres);

    res.end();
    
});

app.get('/genre/:id_de_genre/artists', (req, res) => {

    // Vérification si le genre existe
    // some parcours le tableau et renvoie un booléan si un élément est trouvé
    

    const artists = db.artists.filter((artist) => artist.genreId === req.params.id_de_genre);
    res.set('Content-Type', 'application/json');

    res.send(artists);
});

app.get('/genre/:id_de_lartist/albums', (req, res) => {
    const artistExists = db.artists.some((artist) => artist.id===req.params.id_de_lartist)
    if(!artistExists) {
        res.status(404).send("Artist introuvable");
    }


    const albums = db.albums.filter((album) => album.artistId === req.params.id_de_lartist)
    res.set('Content-Type', 'application/json');

    res.send(albums);


})


module.exports = app;

