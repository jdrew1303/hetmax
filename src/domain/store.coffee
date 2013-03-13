async = require 'async'

@index = (store, done) ->

  { store } = require "../stores/#{store}"
  { best_price } = require './product'

  index_spider = (spider, done) ->

    index_product = (product, done) ->
      done()
#      best_price spider, product.model, done

    async.each store.inventory, index_product, done

  async.each store.spiders, index_spider, done

