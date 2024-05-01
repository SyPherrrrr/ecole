'use strict';

// import du module Express
let express = require('express');
let app = express();


// export de notre application vers le serveur principal
module.exports = app;

const db = require('./data/db.json');


// Liste des genres
app.get('/genres/', function(req, res) {
    console.log("jsuis laaaaaaaa");

    const genres = JSON.stringify(db.json);

    res.set('Content-Type','application/json');
    
    res.send(genres);

    res.end();

});