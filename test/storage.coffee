{ save, find } = require '../src/utils/storage'

describe 'Saving search results', ->

  it 'saves a product', (done) ->

    save
      model: 'diNovo edge'
      price: 100
      url: 'http://www.amazon.com/Logitech-diNovo-Edge-Keyboard-Black/dp/B000J43HJ8'

    find 'diNovo edge', (kb) ->
      kb.price.should.eql 100

    done()