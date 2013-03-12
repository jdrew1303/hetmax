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

  product = (values, result) ->
    values.spider = spider
    values.model = model
    product = new Product values
    product.save (e) ->
      product.saved = not e?
      result product

  { search } = require "../spiders/#{spider}"

  search model, (e, results) -> product(
    _.min results, (x) -> x.price
    best
  )
