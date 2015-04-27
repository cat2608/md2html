"use strict"

Test = require("zenrequest").Test

module.exports = ->
  tasks = []
  tasks.push _create()
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
  Test "POST", "markdown/save", document, null, "Sending MD to convert", 200
