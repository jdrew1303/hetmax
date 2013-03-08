_ = require 'underscore'

@search = (spider, product, best) ->
  { search } = require "./#{spider}"
  search product, (e, results) ->
    best _.min results, (x) -> x.price
