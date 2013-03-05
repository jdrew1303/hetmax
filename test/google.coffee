{ search } = require '../src/spiders/google'

p = (x) -> console.log JSON.stringify x
w = (x) -> require('fs').writeFileSync 'out.html', x

describe 'Google Spider', ->

  it 'should fetch me stuff', (done) ->

    search '3TL941C', (e, results) ->
      results.should.not.be.empty
      done()
