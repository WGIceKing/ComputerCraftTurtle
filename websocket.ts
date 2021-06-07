import { Server } from 'ws';

const wss = new Server({ port: 5757 });

wss.on('connection', function connection(ws) {
  ws.on('message', function incoming(message) {
    console.log('received: %s', message);
  });

  ws.send('Hello im a server')
});