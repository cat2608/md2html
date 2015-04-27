"use strict"

C        = require "../common/constants"
fs       = require "fs"
Document = require "../common/models/document"

module.exports = (server) ->

  ###
   * Retrieve HTML
   * @method  get
   * @param
  ###
  server.get "/markdown/get", (request, response) ->
    if request.required ["id"]
      Document.search(_id: request.parameters.id, limit = 1).then (error, result) ->
        if error
          response.json message: error.message, error.code
        else
          response.json html: result.parse()


  ###
   * Convert MD to HTML
   * @method  post
   * @param   {String} text in markdown
  ###
  server.post "/markdown/save", (request, response) ->
    text = request.parameters.text

    for key, value of C.MARKDOWN
      text = text.replace C.MARKDOWN[key].REGEX, (value) ->
        value.trim().replace C.MARKDOWN[key].REGEX, C.MARKDOWN[key].HTML

    Document.register(text).then (error, result) ->
      if error
        response.badRequest()
      else
        fs.writeFile "#{__dirname}/../www/index.html", result.parse().text
        response.json html: result.parse()

