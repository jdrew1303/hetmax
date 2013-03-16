{ index } = require '../src/domain/store'

describe 'Stores', ->

  describe 'Navarrete', ->

    it 'should be indexed', (done) ->
      index 'navarrete', -> done()
