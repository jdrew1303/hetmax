async = require 'async'

@index = (store, done) ->

  { store } = require "../stores/#{store}"
  { best_price } = require './product'

  index_spider = (spider, done) ->
    p spider
    done()

  async.each store.spiders, index_spider, done

