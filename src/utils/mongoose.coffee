require '../settings'
global.mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.ObjectId

mongoose.connect "mongodb://#{settings.db}/hetmax"
mongoose.connection.on 'open',
  -> console.log 'connected to db'

