"use strict";
exports.__esModule = true;
var ws_1 = require("ws");
var wss = new ws_1.Server({ port: 5757 });
wss.on('connection', function connection(ws) {
    ws.on('message', function incoming(message) {
        console.log('received: %s', message);
    });
    ws.send('Hello im a server');
});
