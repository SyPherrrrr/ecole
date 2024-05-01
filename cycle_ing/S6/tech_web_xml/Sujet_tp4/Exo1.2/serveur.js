'use strict';

const http = require('http');

http.createServer(function (request,response) {
    // Répondre par un status 200 que si la méthode http est get
    if (request.method === 'GET') {

        // Séparation de la chaine de requete et de l'url
        let url = request.url;
        url = url.split('?');
        const url_char = url[0];
        const requete = url[1];

        // Concaténation des chaines de caractères 
        let char =  `<!DOCTYPE html><html><head><title>Bonjour</title></head><body><h1><p>
        Analyse de votre requete:</p> 
        <p>Vous accedez a l'url: ${url_char} </p> 
        <p>La chaine de requete est: ${requete}</p> `;

        // Gestion des entêtes avec content type et content length
        response.writeHead(200, {'Content-Type': 'text/html'}, {'content-length': Buffer.byteLength(char,'utf8')});
        response.write(char);
        response.end();
    } else {
        response.writeHead(405, {'Content-Type': 'text/plain'});
        response.end("Méthode d'accès non autorisée ");
    }
}).listen(8080);