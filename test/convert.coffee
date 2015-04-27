"use strict"

Test = require("zenrequest").Test
id   = null

module.exports = ->
  tasks = []
  tasks.push _create()
  tasks.push _get()
  tasks

# PROMISES ---------------------------------------------------------------------
_create = -> ->
  document =
    text:
      """
        # Title 1
        More text
        [Google](http://google.com)
        Some text with *Emphasis* word
        [Yahoo](http://yahoo.com)
        Some **WORD** strong

      """
  message = "Sending MD to convert"
  Test "POST", "markdown/save", document, null, message, 200, (response) ->
    id = response.html.id

_get = -> ->
  Test "GET", "markdown/get", id: id, null, "Retrieve HTML", 200
