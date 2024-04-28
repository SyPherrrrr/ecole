'use strict';

// Importation du module http de nodejs avec un require
const http = require('http');

// Création du serveur 
http.createServer(function (request,response) { // La fonction est appelée à chaque fois que qu'une requete http est reçue par le serveur
    response.writeHead(200, {'Content-Type': 'text/plain'});
    response.write("Bonjour");
    response.end();
}).listen(8080);

// .listen(8080) : Cette méthode fait démarrer le serveur HTTP sur le port 8080, 
// ce qui signifie que le serveur écoutera les requêtes entrantes sur ce port.