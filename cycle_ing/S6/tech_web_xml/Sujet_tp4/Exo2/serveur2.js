'use strict'

// Utilisation d'express par rapport à http :
// C'est plus simple car toute la gestion des requetes et des reponses 
//est intégré dans le framework express alors qu'avec http on doit tout gérer à la main

const express = require('express');
const app = express();
const api = require('./api/api');


app.use(express.static('public'));

app.listen(8080, () => {
    console.log('Le serveru ecoute sur le port 8080');
});

app.use('/api', api);

