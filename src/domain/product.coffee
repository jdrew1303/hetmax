_ = require 'underscore'
require '../utils/mongoose'

Product = mongoose.model 'Product', new mongoose.Schema
  spider: String
  model: String
  seller: String
  price: Number
  total: Number
  shipping: Number
  url: String

@best_price = (spider, model, best) ->

  product = (values) ->
    values.spider = spider
    values.model = model
    new Product values

  { search } = require "../spiders/#{spider}"

  search model, (e, results) ->
    best product _.min results, (x) -> x.price
