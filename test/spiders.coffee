{ best_price } = require '../src/domain/product'

describe 'Spiders', ->

  { store } = require '../src/stores/navarrete'
  model = store.inventory[0].model

  describe 'Google', ->

    it 'should fetch me stuff', (done) ->
      verify_finds_best_price 'google', model, 10000, done

  describe 'Shopmania', ->

    it 'should fetch me stuff', (done) ->
      verify_finds_best_price 'shopmania', model, 10000, done

  verify_finds_best_price = (spider, model, max_price, done) ->
    best_price spider, model, (e, product) ->
      product.price.should.be.lessThan max_price
      done e
