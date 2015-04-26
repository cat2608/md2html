"use strict";

var Hapi = require('hapi');
var routes = require('./src/routes');

var server = new Hapi.Server();
server.connection({ port: 3000 });

for (var route in routes) {
  server.route(routes[route]);
}

module.exports = server;

server.start();
console.log('Server running');
