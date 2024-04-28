'use strict';

const http = require('http');

http.createServer(function (request,response) {
    if (request.method === 'GET') {

        let url = request.url;
        url = url.split('?');
        const url_char = url[0];
        const requete = url[1];

       let char =  `<!DOCTYPE html><html><head><title>Bonjour</title></head><body><h1><p>
        Analyse de votre requete:</p> 
        <p>Vous accedez a l'url: ${url_char} </p> 
        <p>La chaine de requete est: ${requete}</p> `;

        response.writeHead(200, {'Content-Type': 'text/html'}, {'content-length': Buffer.byteLength(char,'utf8')});
        console.log(Buffer.byteLength(char,'utf8'));
        response.write(char);
        response.end();
    } else {
        response.writeHead(405, {'Content-Type': 'text/plain'});
        response.end("Méthode d'accès non autorisée ");
    }
}).listen(8080);