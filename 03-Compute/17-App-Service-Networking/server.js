const http = require('http');
const options = { host: '10.5.3.4', port: 80, path: '/' }; // use actual private IP

const server = http.createServer((req, res) => {
  const clientReq = http.request(options, (clientRes) => {
    let data = '';
    clientRes.on('data', chunk => data += chunk);
    clientRes.on('end', () => res.end(data));
  });
  clientReq.on('error', () => res.end('VM not reachable'));
  clientReq.end();
});
server.listen(process.env.PORT || 80);