{ best_price } = require '../src/domain/product'

describe 'Google Spider', ->

  it 'should fetch me stuff', (done) ->

    best_price 'google', '3TL941C', (result) ->
      result.price.should.be.lessThan 500
      done()
