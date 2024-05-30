'use strict';

// import du module Express
let express = require('express');
let app = express();
const fetch = require('node-fetch');
const xpath = require('xpath');
const {DOMParser} = require('xmldom');



app.get('/genres', async (req, res) => {
    try {
        const genresReq = await fetch('http://ws.audioscrobbler.com/2.0/?method=tag.getTopTags&api_key=2c08f218f45c6f367a0f4d2b350bbffc.')
        const genresXML = new DOMParser().parseFromString(await genresReq.text());
        const genres = xpath.select('//name.text()', genresXML).map(elem => elem.data);

        const promises = [];
        
        genres.forEach((elem) => {
            promises.push(fetch('http://ws.audioscrobbler.com/2.0/?method=tag.getinfo&tag=' +
                `${elem}&api_key=2c08f218f45c6f367a0f4d2b350bbffc`));
        });
    } catch(erreur) {
        console.log(erreur)
    }
    
})



// export de notre application vers le serveur principal
module.exports = app;

