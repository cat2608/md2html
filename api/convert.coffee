"use strict"

Document = require "../common/models/document"

module.exports = (server) ->
  server.get "/markdown/get", (request, response) ->
    response.ok()
