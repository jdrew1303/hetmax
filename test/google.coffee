{ search } = require '../src/spiders/google'

describe 'Google Spider', ->

  it 'should fetch me stuff', (done) ->

    search '3TL941C', (e, results) ->
      results.should.not.be.empty
      done()
