'use strict';

// Importation express
let express = require('express');
let app = express();

// Indiquer à Express de servir le contenu statique depuis le répertoire 'public'
app.use(express.static('public')); // Afficher le site 


// Créer le serveur et le faire écouter sur le port 8080
app.listen(8080, () => {
    console.log('Serveur démarré sur le port 8080');
});

let api = require('./api/api');

app.use('/api', api);




