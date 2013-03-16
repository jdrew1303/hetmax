{ best_price } = require '../src/domain/product'

describe 'Spiders', ->

  navarrete = require('../src/stores/navarrete').store

  describe 'Google', ->

    it 'should fetch me stuff', (done) ->
      p model = navarrete.inventory[0].model
      verify_finds_best_price 'google', model, 500, done

  describe 'Shopmania', ->

    it 'should fetch me stuff', (done) ->
      verify_finds_best_price 'shopmania', '3TL941C', 500, done

  verify_finds_best_price = (spider, model, max_price, done) ->
    best_price spider, model, (product) ->
      product.price.should.be.lessThan max_price
      product.saved.should.be.true
      done()
