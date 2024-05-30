'use scritc'

const http = require('http');

http.createServer(function(req, res) {
    if(req.method === 'GET') {
        res.writeHead(200, {'Content-Type': 'text/plain'});
        res.write('Ssalut la team');
        res.end();
    
    } else {
        res.writeHead(405, {'Content-Type': 'text/plain'});
        res.end("Méthode d'accès non autorisée" );
    }
}).listen(8080);

