const http = require('http');

const server = http.createServer((req, res) => {
  if (req.url === '/health') {
    res.writeHead(200);
    res.end('OK');
    return;
  }
  res.writeHead(200);
  res.end('GitOps pipeline working — June 2026! 🚀');
});

server.listen(3000, () => {
  console.log('Server running on port 3000');
});