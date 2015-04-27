"use strict"

Hope    = require("zenserver").Hope
db      = require("zenserver").Mongo.connections.primary
Schema  = require("zenserver").Mongoose.Schema

Document = new Schema
  text: type: String

# -- Static methods ------------------------------------------------------------
Document.statics.register = (text) ->
  promise = new Hope.Promise()
  document = db.model "Document", Document
  new document(text:text).save (error, value) -> promise.done error, value
  promise

Document.statics.search = (query, limit = 0) ->
  promise = new Hope.Promise()
  @find(query).limit(limit).exec (error, value) ->
    if limit is 1 and not error
      error = code: 402, message: "Document not found." if value.length is 0
      value = value[0]
    promise.done error, value
  promise

# -- Instance methods ----------------------------------------------------------
Document.methods.parse = ->
  id  : @_id
  text: @text

exports = module.exports = db.model "Document", Document
