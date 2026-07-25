const http = require('http');

const server = http.createServer((req, res) => {
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.end('<h1>Hello Staging v2</h1>');
});

const port = process.env.PORT || 8080;
server.listen(port);
