"use strict"

C        = require "../common/constants"
Document = require "../common/models/document"

module.exports = (server) ->

  ###
   * Convert MD to HTML
   * @param   {String} text in markdown
  ###
  server.get "/markdown/get", (request, response) ->
    response.ok()

  server.post "/markdown/save", (request, response) ->

    text = request.parameters.text

    text = text.replace C.MARKDOWN.HEADING, (search) ->
      search.trim().replace C.MARKDOWN.HEADING, '<h1>$2</h1>'

    text = text.replace C.MARKDOWN.LINK, (url) ->
      url.trim().replace C.MARKDOWN.LINK, '<a href="$1">$2</a>'

    text = text.replace C.MARKDOWN.STRONG, (string) ->
      string.trim().replace C.MARKDOWN.STRONG, '<strong>$1</strong>'

    text = text.replace C.MARKDOWN.EMPHASIS, (string) ->
      string.trim().replace C.MARKDOWN.EMPHASIS, '<em>$1</em>'

    response.ok()
