const http = require('http');
const server = http.createServer((req, res) => {
  if (req.url === '/cpu') {
    // Busy-wait for 5 seconds to generate CPU load
    const start = Date.now();
    while (Date.now() - start < 5000) { Math.sqrt(Math.random()); }
    res.end('CPU burn done');
  } else {
    res.end('Hello from autoscale demo');
  }
});
server.listen(process.env.PORT || 80);