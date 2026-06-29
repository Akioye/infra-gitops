const http = require('http');

const server = http.createServer((req, res) => {
  if (req.url === '/health') {
    res.writeHead(200);
    res.end('OK');
    return;
  }
  res.writeHead(500);
  res.end('BROKEN - deployment failed!');
});

server.listen(3000, () => console.log('running'));