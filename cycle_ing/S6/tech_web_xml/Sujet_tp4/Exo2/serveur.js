'use strict';

// Importation express
let express = require('express');
let app = express();

// Indiquer à Express de servir le contenu statique depuis le répertoire 'public'
// Route par default
app.use(express.static('public')); // Afficher le site 


// Créer le serveur et le faire écouter sur le port 8080
app.listen(8080, () => {
    console.log('Serveur démarré sur le port 8080');
});


let api = require('./api/api');

// Si je fais localhost:8080/api on fait ce qu'il y a dans le fichier ./api/api
// Comme un if (le chemin est /api ) alors on fait ce qu'il y a dans api (possible de mettre function (){...} et l'éxecuter)
app.use('/api', api);

