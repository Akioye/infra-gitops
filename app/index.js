const http = require('http');

const server = http.createServer((req, res) => {
  if (req.url === '/health') {
    res.writeHead(200);
    res.end('OK');
    return;
  }
  res.writeHead(200);
  res.end('Testing on staging first! 🧪');
});

server.listen(3000, () => {
  console.log('Server running on port 3000');
});