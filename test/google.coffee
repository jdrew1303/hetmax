{ best_price } = require '../src/spiders/google'

describe 'Google Spider', ->

  it 'should fetch me stuff', (done) ->

    best_price '3TL941C', (result) ->
      p result.url[1]
      result.price.should.not.be.lessThan 400
      done()
