"use strict"

C        = require "../common/constants"
Document = require "../common/models/document"

module.exports = (server) ->

  ###
   * Retrieve HTML
   * @method  get
   * @param
  ###
  server.get "/markdown/get", (request, response) ->
    response.ok()


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
        response.ok()

