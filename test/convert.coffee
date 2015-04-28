"use strict"

Test = require("zenrequest").Test
fs   = require "fs"
id   = null

module.exports = ->
  tasks = []
  tasks.push _create()
  tasks.push _get()
  tasks

# PROMISES ---------------------------------------------------------------------
_create = -> ->
  file = fs.readFileSync "#{__dirname}/../README.md", "utf8"
  document = text: file
  message  = "Sending MD to convert"
  Test "POST", "markdown/save", document, null, message, 200, (response) ->
    id = response.html.id

_get = -> ->
  Test "GET", "markdown/get", id: id, null, "Retrieve HTML", 200
