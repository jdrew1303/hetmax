_ = require 'underscore'

class @Spider
  constructor: (@$)->
  search_product: ->
  _detect_pager: ->
  _get_result_list: ->
  _get_product_from_list: ->

@search = (spider, product, best) ->
  { search } = require "./#{spider}"
  search product, (e, results) ->
    best _.min results, (x) -> x.price
