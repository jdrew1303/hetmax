{ best_price } = require '../src/spiders/shopmania'

describe 'Shopmania Spider', ->

  it 'should fetch me a cheap monitor', (done) ->

    best_price '3TL941C', (err, deal) ->
      console.log deal
      done()
