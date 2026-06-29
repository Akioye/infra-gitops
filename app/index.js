const http = require('http');
const server = http.createServer((req, res) => {
  res.writeHead(500);
  res.end(undefinedVariable);
});
server.listen(3000, () => console.log('running'));