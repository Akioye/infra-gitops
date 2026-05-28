const http = require('http');

const server = http.createServer((req, res) => {
  if (req.url === '/health') {
    res.writeHead(200);
    res.end('OK');
    return;
  }
  // BROKEN - this will crash the app
  res.writeHead(500);
  res.end(undefinedVariable);
});

server.listen(3000, () => {
  console.log('Server running on port 3000');
});