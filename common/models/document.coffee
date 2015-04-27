"use strict"

Hope    = require("zenserver").Hope
db      = require("zenserver").Mongo.connections.primary
Schema  = require("zenserver").Mongoose.Schema

Document = new Schema
  text: type: String

# -- Static methods ------------------------------------------------------------
Document.static.register = (text) ->
  promise = new Hope.Promise()
  document = db.model "Document", Document
  new document(text).save (error, value) -> promise.done error, value
  promise
# -- Instance methods ----------------------------------------------------------

exports = module.exports = db.model "Document", Document
