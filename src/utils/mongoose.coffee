global.mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.ObjectId

mongoose.connect "mongodb://#{settings.db}/fmp"
mongoose.connection.on 'open',
  -> console.log 'connected to db'

