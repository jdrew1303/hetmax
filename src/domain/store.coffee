async = require 'async'

@index = (store, done) ->

  { store } = require "../stores/#{store}"
  { best_price } = require './product'

  index_spider = (spider, done) ->
    p spider

    index_product = (product, done) ->
      p product.model
      best_price spider, product.model, done

    async.eachSeries store.inventory[0..3], index_product, done

  async.eachSeries store.spiders, index_spider, done

